# Omarchy dotfiles

Dotfiles for two Omarchy machines:

- `common` contains configuration shared by both machines.
- `desktop` contains the desktop Hyprland configuration, Waybar, and backup scripts.
- `laptop` contains the laptop Hyprland Lua configuration for Omarchy Quattro.

## Screenshot

![screenshot](screenshot.png)

## Requirements

- [Omarchy](https://omarchy.org/)
- Git
- [GNU Stow](https://www.gnu.org/software/stow/)

Install any applications referenced by the dotfiles before running the setup.

## Installation

Clone the repository into your home directory:

```bash
git clone https://github.com/ctarx/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
```

Install the desktop configuration:

```bash
./setup.sh desktop
```

Install the laptop configuration:

```bash
./setup.sh laptop
```

On the first run, the script adopts files created by Omarchy and then restores
the versions tracked in this repository. The dotfiles therefore replace the
existing Omarchy configuration.

On later runs, the script stows `common` and the selected machine profile.
Only one machine profile is linked at a time.

The repository must be clean before the first installation because
`git restore` is used to make the tracked dotfiles win over adopted files.

## Desktop Backup

The desktop profile includes an rsync backup script and a systemd user timer.
The setup script links these files but deliberately does not enable the timer,
because the backup uses the desktop-specific drive and destructive `--delete`
options.

Before enabling the timer:

- Install `rsync` and `notify-send`.
- Mount the backup drive at `/run/media/$USER/Backup`.
- Ensure `/run/media/$USER/Backup/samsara` exists on the mounted drive.
- Review `~/rsync_ignore`. Files excluded there are also deleted from the
  backup destination by `--delete-excluded`.

Verify the units and perform a dry run:

```bash
systemd-analyze --user verify \
  "$HOME/.config/systemd/user/rsync-home.service" \
  "$HOME/.config/systemd/user/rsync-home.timer"

"$HOME/.local/bin/rsync.home.n.sh"
```

Enable the daily 22:00 backup and confirm its next run:

```bash
systemctl --user daemon-reload
systemctl --user enable --now rsync-home.timer
systemctl --user list-timers rsync-home.timer
```

The timer does not unlock or mount the drive. If the drive is unavailable at
22:00, the backup is skipped and a desktop notification is shown. A missed run
is handled by `Persistent=true` when the timer becomes active again.

Run a backup manually with interactive progress:

```bash
rsync.home.sh
```

Inspect scheduled backup logs with:

```bash
journalctl --user -u rsync-home.service
```

## Manual Stow

The equivalent first installation for the desktop is:

```bash
stow --adopt common desktop
git restore --source=HEAD --worktree -- common desktop
stow common desktop
```

For the laptop, replace `desktop` with `laptop`.

## Adding Configuration

To add a program shared by both machines, copy or move its configuration into
the matching path under `common` and run the setup for the current profile. For
example:

```bash
mv "$HOME/.config/foo" "$HOME/.dotfiles/common/.config/foo"
./setup.sh desktop
git add common/.config/foo
```

Use `desktop` or `laptop` instead of `common` when a configuration is specific
to one machine.

## Updating

Pull the repository and run the setup for the machine:

```bash
git pull
./setup.sh desktop
```

Use `laptop` on the laptop.

## Contact

Created by [@ctarx](https://web.libera.chat/). Feel free to reach out!
