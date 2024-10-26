require('barbar').setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  clickable = true,
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '✘' },
      [vim.diagnostic.severity.WARN] = { enabled = true, icon = '>>' },
      [vim.diagnostic.severity.INFO] = { enabled = true, icon = '' },
      [vim.diagnostic.severity.HINT] = { enabled = true, icon = '' },
    },
    gitsigns = {
      added = { enabled = true, icon = '+' },
      changed = { enabled = true, icon = '±' },
      deleted = { enabled = true, icon = '-' },
    },
    filetype = {
      enabled = true,
      custom_colors = false,
    },
    separator = { left = '▎', right = '' },
    separator_style = "thin",
  },
  maximum_padding = 0,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqp',
  no_name_title = nil,
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })

local one_dark = {
  fg = "#abb2bf",
  bg = "#282c34",   -- Active buffer background
  green = "#98c379",
  yellow = "#e5c07b",
  purple = "#c678dd",
  orange = "#d19a66",
  red = "#e06c75",
  aqua = "#56b6c2",
  inactive_bg = "#3e4451",
  inactive_fg = "#5c6370",
  active_fg = "#abb2bf",   -- Text color for active buffer
  fill_bg = "#282c34"      -- Background for empty space
}

-- Define highlight groups for barbar using the One Dark palette
vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = one_dark.active_fg, bg = one_dark.bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { fg = one_dark.active_fg, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = one_dark.yellow, bg = one_dark.bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = one_dark.aqua, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentTarget', { fg = one_dark.red, bg = one_dark.bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferVisible', { fg = one_dark.fg, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { fg = one_dark.fg, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = one_dark.yellow, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleSign', { fg = one_dark.aqua, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleTarget', { fg = one_dark.red, bg = one_dark.bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferInactive', { fg = one_dark.inactive_fg, bg = one_dark.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { fg = one_dark.inactive_fg, bg = one_dark.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = one_dark.yellow, bg = one_dark.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = one_dark.inactive_fg, bg = one_dark.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveTarget', { fg = one_dark.red, bg = one_dark.inactive_bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferTabpages', { fg = one_dark.fg, bg = one_dark.fill_bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = one_dark.fg, bg = one_dark.fill_bg })

vim.api.nvim_set_hl(0, 'BufferOffset', { fg = one_dark.fg, bg = one_dark.fill_bg })

vim.api.nvim_set_hl(0, 'BufferIcon', { fg = one_dark.fg, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferIconMod', { fg = one_dark.yellow, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferIconSign', { fg = one_dark.aqua, bg = one_dark.bg })
vim.api.nvim_set_hl(0, 'BufferIconTarget', { fg = one_dark.red, bg = one_dark.bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferIconInactive', { fg = one_dark.inactive_fg, bg = one_dark.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferIconInactiveMod', { fg = one_dark.inactive_fg, bg = one_dark.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferIconInactiveSign', { fg = one_dark.inactive_fg, bg = one_dark.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferIconInactiveTarget', { fg = one_dark.inactive_fg, bg = one_dark.inactive_bg, bold = true })
