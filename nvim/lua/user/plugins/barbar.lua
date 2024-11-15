local vim = vim

require('barbar').setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  clickable = true,
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '󰅚 ' },
      [vim.diagnostic.severity.WARN] = { enabled = true, icon = '󰀦 ' },
      [vim.diagnostic.severity.INFO] = { enabled = true, icon = '󰋼 ' },
      [vim.diagnostic.severity.HINT] = { enabled = true, icon = '󰌵 ' },
    },
    gitsigns = {
      added = { enabled = true, icon = '󰐕' },
      changed = { enabled = true, icon = '󰜥' },
      deleted = { enabled = true, icon = '󰍴' },
    },
    filetype = {
      enabled = true,
      custom_colors = false,
    },
    separator = { left = '▎', right = '' },
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
