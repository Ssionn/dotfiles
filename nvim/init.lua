local vim = vim

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('user/options')
require('user/plugins')
require('user/keymaps')

vim.cmd [[
  highlight CocPmenu guibg=#191724 guifg=#e0def4
  highlight CocPmenuSel guibg=#26233a guifg=#e0def4
  highlight CocErrorFloat guibg=#191724 guifg=#eb6f92
  highlight CocErrorMsg guifg=#eb6f92
]]
