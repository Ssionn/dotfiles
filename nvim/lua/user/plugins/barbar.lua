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
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = '>>>'},
      [vim.diagnostic.severity.WARN] = {enabled = true, icon = '>>'},
      [vim.diagnostic.severity.INFO] = {enabled = true, icon = ''},
      [vim.diagnostic.severity.HINT] = {enabled = true, icon = ''},
    },
    gitsigns = {
      added = {enabled = true, icon = ''},
      changed = {enabled = true, icon = '柳'},
      deleted = {enabled = true, icon = ''},
    },
    filetype = {
      enabled = true,
      custom_colors = false,
    },
    separator = {left = '▎', right = ''},
    separator_style = "thin",
  },
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqp',
  no_name_title = nil,
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })

local one_monokai = {
    fg = "#abb2bf",
    bg = "#1e2024",
    green = "#98c379",
    yellow = "#e5c07b",
    purple = "#c678dd",
    orange = "#d19a66",
    peanut = "#f6d5a4",
    red = "#e06c75",
    aqua = "#61afef",
    darkblue = "#282c34",
    dark_red = "#f75f5f",
}

-- Define highlight groups for barbar
vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = one_monokai.fg, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { fg = one_monokai.fg, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = one_monokai.yellow, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = one_monokai.aqua, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentTarget', { fg = one_monokai.red, bg = one_monokai.bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferVisible', { fg = one_monokai.fg, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { fg = one_monokai.fg, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = one_monokai.yellow, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferVisibleSign', { fg = one_monokai.aqua, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferVisibleTarget', { fg = one_monokai.red, bg = one_monokai.darkblue, bold = true })
vim.api.nvim_set_hl(0, 'BufferInactive', { fg = one_monokai.fg, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { fg = one_monokai.fg, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = one_monokai.yellow, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = one_monokai.aqua, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferInactiveTarget', { fg = one_monokai.red, bg = one_monokai.darkblue, bold = true })
vim.api.nvim_set_hl(0, 'BufferTabpages', { fg = one_monokai.fg, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = one_monokai.fg, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferIcon', { fg = one_monokai.fg, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferIconMod', { fg = one_monokai.yellow, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferIconSign', { fg = one_monokai.aqua, bg = one_monokai.bg })
vim.api.nvim_set_hl(0, 'BufferIconTarget', { fg = one_monokai.red, bg = one_monokai.bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferIconInactive', { fg = one_monokai.fg, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferIconInactiveMod', { fg = one_monokai.yellow, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferIconInactiveSign', { fg = one_monokai.aqua, bg = one_monokai.darkblue })
vim.api.nvim_set_hl(0, 'BufferIconInactiveTarget', { fg = one_monokai.red, bg = one_monokai.darkblue, bold = true })
