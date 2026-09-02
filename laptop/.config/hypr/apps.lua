-- Laptop application window rules.
require("hypr.apps-common")

-- Application routing.
o.window({ class = "^steam$", title = "^Steam$" }, { workspace = "4" })

-- Outlands runs Razor under Proton; Wine maps every Razor window, dialog and
-- dropdown to a separate window. None of them are game windows, so remove the
-- game tag from the whole class instead of matching each title separately.
o.window({ class = "^steam_app_2336620594$" }, { tag = "-game", workspace = "4" })
o.window({ tag = "game" }, { opacity = "1 1", workspace = "4" })
o.window({ class = "^steam_app_2336620594$", initial_title = "^(Ultima Online|Razor Outlands Edition|ClassicUO.*)$" }, {
  float = true,
  center = true,
  fullscreen = false,
  size = { "monitor_w*0.35", "monitor_h*0.35" },
})
