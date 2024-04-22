require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    adaptive_size = true,
    side = "right",
  },
  git = {
    enable = false,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  }, 
})

vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>co', ':NvimTreeCollapse<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>r', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fl', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
