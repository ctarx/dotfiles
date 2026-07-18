-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Calculator instead of the default calendar binding.
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Calculator", o.launch("gnome-calculator"))

-- FreeTube instead of the default Music binding.
hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + M", "FreeTube", o.launch("freetube --new-window"))

-- Proton Mail instead of the default HEY binding.
hl.unbind("SUPER + SHIFT + E")
o.bind("SUPER + SHIFT + E", "Email", o.launch_webapp("https://mail.proton.me/u/0/inbox"))

-- Proton Pass instead of the default 1Password binding.
hl.unbind("SUPER + SHIFT + SLASH")
o.bind("SUPER + SHIFT + SLASH", "Proton Pass", o.launch_webapp("https://pass.proton.me"))

-- Close the active window with SUPER+Q instead of SUPER+W.
hl.unbind("SUPER + W")
o.bind("SUPER + Q", "Close active window", hl.dsp.window.close())

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, { omarchy = "walker -m symbols" })
