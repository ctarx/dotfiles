-- Personal application window rules.

-- Application routing.
o.window({ class = "^steam$", title = "^Steam$" }, { workspace = "4" })
o.window({ class = "^(signal|brave-discord\\.com__channels_@me-Default|brave-web\\.whatsapp\\.com__-Default)$" }, {
  tag = "+chat",
  workspace = "5",
  opacity = "1 1",
})

-- Outlands launcher/helper windows should not inherit the fullscreen game rule.
o.window({ class = "^steam_app_2336620594$" }, { tag = "+game" })
o.window({ class = "^steam_app_2336620594$", initial_title = "^(Ultima Online|Razor Outlands Edition|ClassicUO.*)$" }, {
  tag = "-game",
  workspace = "4",
})
-- Razor's native popup menus have no title; keep them out of game rules.
o.window({ class = "^steam_app_2336620594$", initial_title = "^$" }, {
  tag = "-game",
  workspace = "4",
})
o.window({ tag = "game" }, { opacity = "1 1", workspace = "4" })
o.window({ class = "^steam_app_2336620594$", initial_title = "^(Ultima Online|Razor Outlands Edition|ClassicUO.*)$" }, {
  float = true,
  center = true,
  fullscreen = false,
  size = { "monitor_w*0.35", "monitor_h*0.35" },
})

-- Give the About TUI enough room for fastfetch when the terminal font is larger.
o.window({ class = "^org\\.omarchy\\.bash$" }, {
  tag = "+about-tui",
})
o.window({ tag = "about-tui" }, {
  size = { "monitor_w*0.70", "monitor_h*0.80" },
})

-- Float and center utility applications at their natural size.
o.window("^(net\\.davidotek\\.pupgui2|Exodus|Popsicle|WowUpCf|CurseForge)$", {
  float = true,
  center = true,
})

-- Give the Mudlet editor a larger floating window.
o.window({ class = "^Mudlet$", title = "^(Arkadia - Editor)$" }, {
  float = true,
  size = { "monitor_w*0.5", "monitor_h*0.7" },
})

-- Resize WoWUp and CurseForge windows.
o.window("^(WowUpCf|CurseForge)$", {
  size = { "monitor_w*0.75", "monitor_h*0.7" },
})

-- Keep FreeTube fully opaque.
o.window("^FreeTube$", {
  tag = "-default-opacity",
  opacity = "1 1",
})
