vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.signcolumn = 'yes:2'

vim.opt.completeopt = 'menuone,longest,preview'

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = 'longest:full,full'

vim.opt.title = true
vim.opt.mouse = 'a'

vim.opt.spell = true

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '•' }
vim.opt.fillchars:append({ eob = ' ' })

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.confirm = true

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove('.')

vim.g.skip_ts_context_commentstring_module = true

vim.api.nvim_set_hl(0, 'StatusLineNonText', {
    fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
    bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
})

vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ffffff gui=underline
    :hi      NvimTreeSymlink     guifg=White  gui=italic
    :hi link NvimTreeImageFile   Title
]])
