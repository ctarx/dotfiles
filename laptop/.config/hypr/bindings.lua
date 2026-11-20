-- Keep only your personal keybinding overrides here. Add new bindings with
-- o.bind or replace defaults with o.rebind.

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

-- Change an existing binding. o.rebind takes the same arguments as o.bind.
-- This example replaces the default file manager with Flea.
-- o.rebind("SUPER + SHIFT + F", "File manager", { launch = "flea" })

-- Calendar web app instead of the default calendar binding.
o.rebind("SUPER + SHIFT + C", "Calendar", { webapp = "https://cloud.ctsrv.org/apps/calendar/dayGridMonth/now" })

-- FreeTube instead of the default Music binding.
o.rebind("SUPER + SHIFT + M", "FreeTube", { launch = "freetube" })

-- Proton Mail instead of the default HEY binding.
o.rebind("SUPER + SHIFT + E", "Email", { webapp = "https://mail.proton.me/" })

-- Proton Pass instead of the default 1Password binding.
o.rebind("SUPER + SHIFT + SLASH", "Proton Pass", { webapp = "https://pass.proton.me/" })

-- Stable closes windows with SUPER+W; use SUPER+Q instead.
hl.unbind("SUPER + W")
o.rebind("SUPER + Q", "Close active window", hl.dsp.window.close())

-- Photos web app.
o.rebind("SUPER + SHIFT + P", "Photos", { webapp = "https://cloud.ctsrv.org/apps/photos/" })

-- Disable unused default application bindings.
hl.unbind("SUPER + SHIFT + CTRL + G")
hl.unbind("SUPER + SHIFT + X")
hl.unbind("SUPER + SHIFT + ALT + X")
hl.unbind("SUPER + SHIFT + ALT + E")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, { omarchy = "walker -m symbols" })
