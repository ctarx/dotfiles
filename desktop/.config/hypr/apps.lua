-- Desktop application window rules.
require("hypr.apps-common")

-- Games.
o.window({ class = "^(steam_app.*|gamescope)$" }, { tag = "+game", workspace = "4" })
o.window({ title = "^World of Warcraft$" }, { tag = "+game" })
-- Outlands runs Razor under Proton; Wine maps every Razor window, dialog and
-- dropdown to a separate window. None of them are game windows, so remove the
-- game tag from the whole class instead of matching each title separately.
o.window({ class = "^steam_app_3553891653$" }, { tag = "-game", workspace = "4" })
-- Battle.net's tray icon has nowhere to dock, so Wine shows it in an untitled
-- explorer.exe window. Keep it a small floating window instead of fullscreen.
o.window({ class = "^steam_app_2586847247$", title = "^$" }, {
	tag = "-game",
	float = true,
	fullscreen = false,
	no_initial_focus = true,
	workspace = "4",
})
o.window({ tag = "game" }, { opacity = "1 1", fullscreen = true, workspace = "4" })
o.window({ class = "^steam_app_3553891653$", initial_title = "^(Ultima Online|Razor Outlands Edition|ClassicUO.*)$" }, {
	float = true,
	center = true,
	fullscreen = false,
})
-- The launcher ("Ultima Online") has a fixed size; forcing one stretches it
-- and offsets its click targets, so only Razor gets resized.
o.window({ class = "^steam_app_3553891653$", initial_title = "^Razor Outlands Edition$" }, {
	size = { "monitor_w*0.35", "monitor_h*0.35" },
})
o.window({ class = "^steam$", title = "^Steam$" }, { workspace = "4" })

-- Battle.net launched through Steam is a game-class window, but the launcher
-- should not inherit the fullscreen game rule. Its float, size and workspace
-- come from apps-common.
o.window({ class = "^steam_app_2586847247$", title = "^Battle\\.net.*$" }, {
  tag = "-game",
  fullscreen = false,
})
o.window({ class = "^steam_app_2586847247$", title = "^Battle\\.net.*$" }, {
  tag = "+game-launcher",
  fullscreen = false,
})

-- Keep the Nextcloud client consistently sized and centered.
o.window({ class = "^Nextcloud$" }, {
	float = true,
	center = true,
	fullscreen = false,
	size = { "monitor_w*0.7", "monitor_h*0.8" },
})
