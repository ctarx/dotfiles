-- Keep only your personal keybinding overrides here. Add new bindings with
-- o.bind or replace defaults with o.rebind.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable only the preinstalled app/webapp bindings, set this in the same
-- place in ~/.config/hypr/hyprland.lua:
--   omarchy_preinstalled_bindings = false

-- Add a new binding. xdg-terminal-exec opens the default terminal.
-- o.bind("SUPER + SHIFT + R", "SSH", "xdg-terminal-exec -e ssh your-server")

-- Change an existing binding. o.rebind takes the same arguments as o.bind.
-- This example replaces the default file manager with Flea.
-- o.rebind("SUPER + SHIFT + F", "File manager", { launch = "flea" })

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Volume keys for a keyboard without media keys. F9, F10 and Pause are not
-- used by any Omarchy default binding.
o.bind("SUPER + F9", "Volume down", "omarchy-audio-output-volume lower", { locked = true, repeating = true })
o.bind("SUPER + F10", "Volume up", "omarchy-audio-output-volume raise", { locked = true, repeating = true })
o.bind("SUPER + PAUSE", "Mute", "omarchy-audio-output-volume mute-toggle", { locked = true })
o.bind("SUPER + SHIFT + PAUSE", "Switch audio output", "omarchy-audio-output-switch", { locked = true })

o.rebind("SUPER + SHIFT + C", "Calendar", { webapp = "https://cloud.ctsrv.org/apps/calendar/dayGridMonth/now" })

o.rebind("SUPER + SHIFT + M", "FreeTube", { launch = "freetube" })

o.rebind("SUPER + SHIFT + SLASH", "Proton Pass", { webapp = "https://pass.proton.me/" })

o.rebind("SUPER + SHIFT + E", "Proton Mail", { webapp = "https://mail.proton.me/" })

o.rebind("SUPER + SHIFT + P", "Photos", { webapp = "https://cloud.ctsrv.org/apps/photos/" })

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
-- o.bind("SUPER + PERIOD", nil, { panel = "omarchy.emojis" })
