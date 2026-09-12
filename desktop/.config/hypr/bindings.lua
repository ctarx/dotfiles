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

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Replace the default close-window binding.
hl.unbind("SUPER + W")
o.bind("SUPER + Q", "Close active window", hl.dsp.window.close())

-- Volume keys for a keyboard without media keys. F9, F10 and Pause are not
-- used by any Omarchy default binding.
o.bind("SUPER + F9", "Volume down", "omarchy-audio-output-volume lower", { locked = true, repeating = true })
o.bind("SUPER + F10", "Volume up", "omarchy-audio-output-volume raise", { locked = true, repeating = true })
o.bind("SUPER + PAUSE", "Mute", "omarchy-audio-output-volume mute-toggle", { locked = true })
o.bind("SUPER + SHIFT + PAUSE", "Switch audio output", "omarchy-audio-output-switch", { locked = true })

hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Calendar", { webapp = "https://cloud.ctsrv.org/apps/calendar/dayGridMonth/now" })

hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + M", "FreeTube", { launch = "freetube" })

hl.unbind("SUPER + SHIFT + SLASH")
o.bind("SUPER + SHIFT + SLASH", "Proton Pass", { webapp = "https://pass.proton.me/" })

hl.unbind("SUPER + SHIFT + E")
o.bind("SUPER + SHIFT + E", "Proton Mail", { webapp = "https://mail.proton.me/" })

hl.unbind("SUPER + SHIFT + P")
o.bind("SUPER + SHIFT + P", "Photos", { webapp = "https://cloud.ctsrv.org/apps/photos/" })

hl.unbind("SUPER + SHIFT + CTRL + G")
hl.unbind("SUPER + SHIFT + X")
hl.unbind("SUPER + SHIFT + ALT + X")
hl.unbind("SUPER + SHIFT + ALT + E")

-- Desktop keyboard has a classic Menu (context menu) key instead of the
-- Copilot key laptops use for SUPER + SHIFT + code:201 -> Omarchy menu.
o.bind("Menu", "Omarchy menu", "omarchy-menu toggle root")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
