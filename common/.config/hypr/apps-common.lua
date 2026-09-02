-- Application window rules shared by every profile.

-- Chat and messaging applications.
o.window({ class = "^(signal|brave-discord\\.com__channels_@me-Default|brave-web\\.whatsapp\\.com__-Default)$" }, {
  tag = "+chat",
  workspace = "5",
  opacity = "1 1",
})

-- Float and center utility applications at their natural size.
o.window("^(Exodus|Popsicle|CurseForge)$", {
  float = true,
  center = true,
})

-- Resize CurseForge window.
o.window("^CurseForge$", {
  size = { "monitor_w*0.75", "monitor_h*0.7" },
})

-- Give the Mudlet editor a larger floating window.
o.window({ class = "^Mudlet$", title = "^Arkadia - Editor$" }, {
  float = true,
  size = { "monitor_w*0.5", "monitor_h*0.7" },
})

-- Keep FreeTube fully opaque.
o.window("^FreeTube$", {
  tag = "-default-opacity",
  opacity = "1 1",
})
