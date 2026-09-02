-- Desktop application window rules.
require("hypr.apps-common")

-- Games.
o.window({ class = "^(steam_app.*|gamescope)$" }, { tag = "+game", workspace = "4" })
o.window({ title = "^World of Warcraft$" }, { tag = "+game" })
-- Outlands runs Razor under Proton; Wine maps every Razor window, dialog and
-- dropdown to a separate window. None of them are game windows, so remove the
-- game tag from the whole class instead of matching each title separately.
o.window({ class = "^steam_app_3553891653$" }, { tag = "-game", workspace = "4" })
o.window({ tag = "game" }, { opacity = "1 1", fullscreen = true, workspace = "4" })
o.window({ class = "^steam_app_3553891653$", initial_title = "^(Ultima Online|Razor Outlands Edition|ClassicUO.*)$" }, {
	float = true,
	center = true,
	fullscreen = false,
	size = { "monitor_w*0.35", "monitor_h*0.35" },
})
o.window({ class = "^steam$", title = "^Steam$" }, { workspace = "4" })

-- Battle.net launched through Steam is a game-class window, but the launcher
-- should not inherit the fullscreen game rule.
o.window({ class = "^steam_app_2586847247$", title = "^Battle\\.net.*$" }, {
  tag = "-game",
  fullscreen = false,
  workspace = "4",
})
o.window({ class = "^steam_app_2586847247$", title = "^Battle\\.net.*$" }, {
  tag = "+game-launcher",
  fullscreen = false,
  float = true,
	workspace = "4",
	center = true,
	size = { "monitor_w*0.6", "monitor_h*0.6" },
})

-- Keep the Nextcloud client consistently sized and centered.
o.window({ class = "^Nextcloud$" }, {
	float = true,
	center = true,
	fullscreen = false,
	size = { "monitor_w*0.7", "monitor_h*0.8" },
})
