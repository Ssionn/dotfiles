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
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = '✘'},
      [vim.diagnostic.severity.WARN] = {enabled = true, icon = '>>'},
      [vim.diagnostic.severity.INFO] = {enabled = true, icon = ''},
      [vim.diagnostic.severity.HINT] = {enabled = true, icon = ''},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '±'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      enabled = true,
      custom_colors = false,
    },
    separator = {left = '▎', right = ''},
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

local rose_pine_dawn = {
    fg = "#575279",
    bg = "#ebe5df",  -- Active buffer background
    green = "#9ccfd8",
    yellow = "#f6c177",
    purple = "#c4a7e7",
    orange = "#f5a97f",
    peanut = "#f5c2e7",
    red = "#eb6f92",
    aqua = "#9ccfd8",
    darkblue = "#1f1f28",
    dark_red = "#eb6f92",
    inactive_bg = "#f2ede9",
    inactive_fg = "#797593",
    active_fg = "#575279",  -- Darker text for active buffer
    fill_bg = "#faf4ed"     -- Light background for empty space
}

-- Define highlight groups for barbar
vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = rose_pine_dawn.active_fg, bg = rose_pine_dawn.bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { fg = rose_pine_dawn.active_fg, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = rose_pine_dawn.yellow, bg = rose_pine_dawn.bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = rose_pine_dawn.aqua, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferCurrentTarget', { fg = rose_pine_dawn.red, bg = rose_pine_dawn.bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferVisible', { fg = rose_pine_dawn.fg, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { fg = rose_pine_dawn.fg, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = rose_pine_dawn.yellow, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleSign', { fg = rose_pine_dawn.aqua, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferVisibleTarget', { fg = rose_pine_dawn.red, bg = rose_pine_dawn.bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferInactive', { fg = rose_pine_dawn.inactive_fg, bg = rose_pine_dawn.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { fg = rose_pine_dawn.inactive_fg, bg = rose_pine_dawn.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = rose_pine_dawn.yellow, bg = rose_pine_dawn.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = rose_pine_dawn.inactive_fg, bg = rose_pine_dawn.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferInactiveTarget', { fg = rose_pine_dawn.red, bg = rose_pine_dawn.inactive_bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferTabpages', { fg = rose_pine_dawn.fg, bg = rose_pine_dawn.fill_bg, bold = true })
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = rose_pine_dawn.fg, bg = rose_pine_dawn.fill_bg })

vim.api.nvim_set_hl(0, 'BufferOffset', { fg = rose_pine_dawn.fg, bg = rose_pine_dawn.fill_bg })

vim.api.nvim_set_hl(0, 'BufferIcon', { fg = rose_pine_dawn.fg, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferIconMod', { fg = rose_pine_dawn.yellow, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferIconSign', { fg = rose_pine_dawn.aqua, bg = rose_pine_dawn.bg })
vim.api.nvim_set_hl(0, 'BufferIconTarget', { fg = rose_pine_dawn.red, bg = rose_pine_dawn.bg, bold = true })

vim.api.nvim_set_hl(0, 'BufferIconInactive', { fg = rose_pine_dawn.inactive_fg, bg = rose_pine_dawn.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferIconInactiveMod', { fg = rose_pine_dawn.inactive_fg, bg = rose_pine_dawn.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferIconInactiveSign', { fg = rose_pine_dawn.inactive_fg, bg = rose_pine_dawn.inactive_bg })
vim.api.nvim_set_hl(0, 'BufferIconInactiveTarget', { fg = rose_pine_dawn.inactive_fg, bg = rose_pine_dawn.inactive_bg, bold = true })

