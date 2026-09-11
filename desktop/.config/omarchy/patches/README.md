# Per-monitor Omarchy bar (`ctarx.bar`)

A local clone of the built-in Omarchy bar (`omarchy.bar`) that adds one feature: choosing which monitors get a bar, like `output` in Waybar or the panel output setting in COSMIC.

The stock Omarchy bar always creates one bar per connected monitor. This clone reads a new `bar.outputs` key from `shell.json` and only creates bars on the listed monitors.

## Current setup

- Active bar: `ctarx.bar` (clone), set by `bar.id` in `~/.config/omarchy/shell.json`
- `bar.outputs`: `["DP-1"]`, so the bar shows only on DP-1 (Dell S2725DC) and DP-2 (Dell U2419HC) has no bar and no reserved space
- Based on: `omarchy-dev 4.0.0.r2100.gb5589fa` (upstream commit `b5589faa`), Quickshell 0.3.1

## Files

| Path | What it is |
|---|---|
| `~/.config/omarchy/plugins/ctarx.bar/` | The clone, created with `omarchy plugin clone omarchy.bar` |
| `~/.config/omarchy/patches/bar-outputs.patch` | The changes on top of the stock bar, for re-applying to a fresh clone |
| `~/.config/omarchy/patches/README.md` | This file |

Nothing under `/usr/share/omarchy/` was modified.

## What changed

Only two files in the clone differ from the stock bar (`manifest.json` was rewritten by `omarchy plugin clone` itself: new id `ctarx.bar`, name "My Bar", `omarchy.clonedFrom: "omarchy.bar"`).

### `BarModel.js`

Two new functions, also added to `module.exports`:

- `screenMatches(screen, pattern)` matches one pattern against a Quickshell screen:
  - `"DP-1"` matches the connector name (`screen.name`)
  - `"desc:<text>"` matches if `<text>` appears in the screen's `model` + `serialNumber`
- `barScreens(screens, outputs)` returns the screens that get a bar:
  - no `outputs` (or an empty list) means every screen
  - entries starting with `!` exclude a screen
  - if nothing connected matches, it falls back to the first screen, so the menu and tray never disappear entirely (for example when a laptop is undocked from the listed monitor)

### `Bar.qml`

- `fallbackBarConfig` gains `outputs: []`
- `applyBarConfig()` reads `config.outputs` into a new `outputs` property
- New properties above the panels:
  - `property var outputs: []`
  - `readonly property var barScreens: BarModel.barScreens(Quickshell.screens, outputs)`
  - `function hasBarOn(screen)`, which reports whether a screen has a bar (currently unused; meant for other components such as notifications)
- All three `Variants` blocks (`BarPanel`, `DragGhostPanel`, `BarMoveGhostPanel`) use `model: root.barScreens` instead of `model: Quickshell.screens`

## Configuration

Add `outputs` to the `bar` section of `~/.config/omarchy/shell.json`:

```json
"bar": {
  "id": "ctarx.bar",
  "position": "top",
  "outputs": ["DP-1"],
  ...
}
```

| Value | Result |
|---|---|
| key missing or `[]` | bar on every monitor (stock behaviour) |
| `["DP-1"]` | bar only on DP-1 |
| `["DP-1", "DP-2"]` | bar on both |
| `["!DP-1"]` | bar everywhere except DP-1 |
| `["desc:U2419HC"]` | bar on the monitor whose model/serial contains `U2419HC` (survives port changes) |
| nothing matches | bar on the first screen only |

Changes to `outputs` apply live, with no restart. The built-in `omarchy.bar` ignores this key, so it can stay in `shell.json` when switching bars.

## Switching bars

```bash
omarchy bar reset           # back to the stock Omarchy bar (removes bar.id)
omarchy bar use ctarx.bar   # back to this clone
```

Both write to `shell.json`, so the choice persists across reboots. The clone stays on disk after `reset`. Remove it for good with `omarchy plugin remove ctarx.bar`.

## If something hangs

`omarchy restart shell` only restarts the shell and does not touch `shell.json`, so the same bar comes back. If the clone is the suspect:

```bash
omarchy bar reset
omarchy restart shell
```

If the clone fails to load at all (for example after an update changes the shell's internals), the shell falls back to the stock bar automatically.

## Updates and maintenance

- `omarchy update` does not overwrite the clone: packages only write to `/usr/share/omarchy/`, and no current migration touches `~/.config/omarchy/plugins/` or `bar.id`.
- It does not update the clone either. Fixes to the stock bar do not reach `ctarx.bar`. Refresh it from time to time:

  ```bash
  omarchy plugin remove ctarx.bar
  omarchy plugin clone omarchy.bar
  cd ~/.config/omarchy/plugins/ctarx.bar && patch -p1 < ~/.config/omarchy/patches/bar-outputs.patch
  omarchy restart shell   # needed after any code change; the automatic reload does not pick it up
  ```

- `omarchy refresh shell` resets `shell.json` to the defaults, which drops `bar.id` and `bar.outputs`; switch back to the clone and re-add `outputs` afterwards.

## Known limitations

- **Notifications are not per-monitor.** Omarchy shows every notification on all monitors at once (one popup window per screen). That is stock behaviour and unchanged here.
- **Notification spacing on DP-2.** Popups compute their top offset from the bar globally, so on DP-2 they sit 26 px lower than needed even though there is no bar there. Fixing it would mean cloning `omarchy.notifications` too; left as is on purpose.
- **Only the clone knows about `outputs`.** No `omarchy bar` subcommand manages it; edit `shell.json` directly.
- **Warnings in the log on bar reload.** Every bar reload logs about 80 `TypeError ... of null` warnings from the Bluetooth and network panels, plus `IpcHandler ... another handler is registered` lines. They also appeared when cloning, before any of these changes, so they come from the bar swap itself and are harmless.

## Verification

- Unit test of `barScreens` in Node against both monitors: 10/10 cases passed (no list, connector name, `desc:`, `!`, whitespace, and the fall back to the first screen when nothing matches)
- After `omarchy restart shell` with `outputs: ["DP-1"]`: `hyprctl layers` shows `omarchy-bar` only on DP-1; `hyprctl monitors` shows DP-2 with `reserved=[0,0,0,0]`
- Removing `outputs` without a restart brought the bar back on DP-2; setting `["DP-1"]` again removed it, both live
- A test notification appeared on both monitors

## Upstream

Related upstream discussions (no maintainer response at the time of writing):

- [#7669](https://github.com/omacom/omarchy/discussions/7669) proposes named bar profiles per screen (`bars` + `screens`)
- [#6722](https://github.com/omacom/omarchy/discussions/6722) proposes a plugin API to hide the bar per screen at runtime

This clone is the minimal on/off version. A proper upstream change would also need an `omarchy bar outputs` command, per-screen notification spacing, tests in `test/shell.d/bar-test.sh`, and docs.
