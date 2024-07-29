require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline",
  },
  messages = {
    enabled = true,
    view = "notify",
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  views = {
    cmdline = {
      position = {
        row = "30%", -- center vertically
        col = "50%", -- center horizontally
        anchor = "center", -- use the center as anchor
      },
      size = {
        width = "40%", -- set a fixed width
      },
      border = {
        style = "rounded", -- can be "single", "double", "rounded", "solid", "shadow"
        padding = { 0, 1 }, -- reduce padding: top/bottom and left/right
      },
    },
    notify = {
      position = {
        row = "10%",
        col = "50%",
        anchor = "center",
      },
      size = {
        width = "80%",
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
  },
})
