vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_enable_bw = 1
vim.g.file_explorer_disable_file_type_classification = true

vim.g.rnvimr_layout = {
  relative = 'editor',
  width = vim.fn.float2nr(vim.fn.round(0.7 * vim.o.columns)),
  height = vim.fn.float2nr(vim.fn.round(0.7 * vim.o.lines)),
  col = vim.fn.float2nr(vim.fn.round(0.15 * vim.o.columns)),
  row = vim.fn.float2nr(vim.fn.round(0.15 * vim.o.lines)),
}

vim.keymap.set('n', '<Space>e', ':RnvimrToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>co', ':RnvimrResize 10<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>r', ':RnvimrResize<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fl', ':RnvimrToggle<CR>', { noremap = true, silent = true })


