vim.opt.guifont = "Monaspace Krypton Wide:h15"

vim.opt.signcolumn = 'yes:2'

vim.opt.completeopt = 'menuone,longest,preview'

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

_G.add_new_line = function()
  local file_name = vim.fn.expand('%:t')
  local file_extension = vim.fn.expand('%:e')
  
  -- List of file extensions to exclude
  local excluded_extensions = {
    'php', 'rs', 'js', 'blade.php', 'lua', 'html', 'env', 'env.example', 'gitignore', 'tsx', 'ts', 'jsx', "json"
  }
  
  -- Check if the file extension is in the excluded list
  for _, ext in ipairs(excluded_extensions) do
    if file_extension == ext or file_name:match("%." .. ext .. "$") then
      return
    end
  end
  
  local n_lines = vim.api.nvim_buf_line_count(0)
  local last_nonblank = vim.fn.prevnonblank(n_lines)
  if last_nonblank <= n_lines then 
    vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' }) 
  end
end

vim.cmd([[
  augroup CustomSaveActions
    autocmd!
    autocmd BufWritePre * lua _G.add_new_line()
  augroup END
]])

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = 'longest:full,full'

vim.opt.title = true
vim.opt.mouse = 'a'

vim.opt.spell = true

vim.opt.termguicolors = true

vim.opt.updatetime = 300

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
