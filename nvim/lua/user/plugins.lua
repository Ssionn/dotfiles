local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
require('packer').reset()

require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'solid' })
        end,
    },
})

local use = require('packer').use

use 'wbthomason/packer.nvim'
-- My plugins here
use('tpope/vim-commentary')
use('tpope/vim-surround')
use('tpope/vim-eunuch')
use('tpope/vim-unimpaired')
use('tpope/vim-sleuth')
use('tpope/vim-repeat')
use('sheerun/vim-polyglot')
use('christoomey/vim-tmux-navigator')
use('farmergreg/vim-lastplace')
use('jessarcher/vim-heritage')
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user',
})

-- use({
--     'airblade/vim-rooter',
--     setup = function()
--         vim.g.rooter_manual_only = 1
--     end,
--     config = function()
--         vim.cmd('rooter')
--     end,
-- })

use({
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end,
})

use({
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end,
})

use({
    'famiu/bufdelete.nvim',
    config = function()
        vim.keymap.set('n', '<Leader>q', 'Bdelete<CR>')
    end,
})

use({
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_html_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end,
})

use({
    'sickill/vim-pasta',
    config = function()
        vim.g.paste_disabled_filetypes = { 'fugitive' }
    end,
})

use({
   'nvim-treesitter/nvim-treesitter',
   run = function()
     require('nvim-treesitter.install').update({ with_sync = true })
   end,
   requires = {
     'JoosepAlviste/nvim-ts-context-commentstring',
     'nvim-treesitter/nvim-treesitter-textobjects',
   },
   config = function()
     require('user/plugins/treesitter')
   end,
 })

-- Telescope with keybinds
use({
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.x',
    requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'BurntSushi/ripgrep',
        'sharkdp/fd',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
})

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

use({
   'nvim-lualine/lualine.nvim',
   requires = 'kyazdani42/nvim-web-devicons',
   config = function()
     require('user/plugins/lualine')
   end,
 })

use({
   'akinsho/bufferline.nvim',
   requires = 'kyazdani42/nvim-web-devicons',
   config = function()
     require('user/plugins/bufferline')
   end,
 })

 use({
   'jessarcher/onedark.nvim',
   config = function()
     vim.cmd('colorscheme onedark')

     vim.api.nvim_set_hl(0, 'FloatBorder', {
       fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
       bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
     })
   end,
 })

 use({
   'neovim/nvim-lspconfig',
   requires = {
     'williamboman/mason.nvim',
     'williamboman/mason-lspconfig.nvim',
     'b0o/schemastore.nvim',
   },
   config = function()
     require('user/plugins/lspconfig')
   end,
 })

use({
    'sbdchd/neoformat'
})

 use({
   'hrsh7th/nvim-cmp',
   requires = {
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-nvim-lsp-signature-help',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'L3MON4D3/LuaSnip',
     'saadparwaiz1/cmp_luasnip',
     'onsails/lspkind-nvim',
   },
   config = function()
     require('user/plugins/cmp')
   end,
 })

 use({
   'phpactor/phpactor',
   ft = 'php',
   run = 'composer install --no-dev --optimize-autoloader',
   config = function()
     vim.keymap.set('n', '<Space>pm', ':PhpactorContextMenu<CR>')
     vim.keymap.set('n', '<Space>pn', ':PhpactorClassNew<CR>')
   end,
 })

 -- Git integration.
 use({
   'lewis6991/gitsigns.nvim',
   config = function()
     require('gitsigns').setup()
     vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
     vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
     vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
     vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
     vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
     vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
   end,
 })

 -- Git commands.
 use({
   'tpope/vim-fugitive',
   requires = 'tpope/vim-rhubarb',
 })

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
    augroup end
]])
