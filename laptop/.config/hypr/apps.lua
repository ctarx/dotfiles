-- Personal application window rules.

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

-- Keep media and chat windows fully opaque.
o.window("^(FreeTube|signal)$", {
  tag = "-default-opacity",
  opacity = "1 1",
})
