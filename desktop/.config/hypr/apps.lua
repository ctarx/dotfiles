-- Desktop application window rules.

-- Games.
o.window({ class = "^(steam_app.*|gamescope)$" }, { tag = "+game" })
o.window({ title = "^World of Warcraft$" }, { tag = "+game" })
-- Outlands launcher/helper windows should not inherit the fullscreen game rule.
o.window({ class = "^steam_app_3553891653$", initial_title = "^(Ultima Online|Razor Outlands Edition|ClassicUO.*)$" }, { tag = "-game" })
o.window({ tag = "game" }, { opacity = "1 1", fullscreen = true, workspace = "4" })
o.window({ class = "^steam_app_3553891653$", initial_title = "^(Ultima Online|Razor Outlands Edition|ClassicUO.*)$" }, {
	float = true,
	center = true,
	fullscreen = false,
	size = { "monitor_w*0.35", "monitor_h*0.35" },
})
o.window({ class = "^steam$", title = "^Steam$" }, { workspace = "4" })

-- Game launchers.
o.window({ title = "^Battle\\.net.*$" }, {
	tag = "+game-launcher",
	fullscreen = false,
	float = true,
	center = true,
	size = { "monitor_w*0.6", "monitor_h*0.6" },
})

-- Chat and messaging applications.
o.window({ class = "^(signal|brave-discord\\.com__channels_@me-Default|brave-web\\.whatsapp\\.com__-Default)$" }, {
	tag = "+chat",
	workspace = "5",
	opacity = "1 1",
})

-- Small utilities.
o.window("^(net\\.davidotek\\.pupgui2|Exodus|Popsicle|CurseForge|WowUpCf)$", {
	float = true,
	center = true,
})
o.window("^(WowUpCf|CurseForge)$", {
	size = { "monitor_w*0.75", "monitor_h*0.7" },
})
o.window({ class = "^Mudlet$", title = "^Arkadia - Editor$" }, {
	float = true,
	size = { "monitor_w*0.5", "monitor_h*0.7" },
})
o.window("^FreeTube$", { tag = "-default-opacity", opacity = "1 1" })
