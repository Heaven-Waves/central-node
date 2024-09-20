table.insert(stream_defaults.properties, {
    -- do not restore the last stream properties in order to set volume everytime on boot
    ["restore-props"] = false,
  })