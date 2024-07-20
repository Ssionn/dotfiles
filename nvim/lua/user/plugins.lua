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
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function ()
        require('user/plugins/telescope')
    end,
})

use({
    'kyazdani42/nvim-tree.lua',
    requires = {
        'kyazdani42/nvim-web-devicons',
    },
    config = function ()
        require('user/plugins/nvim-tree')
    end,
    lazy = true
})

use {'edluffy/hologram.nvim'}

use({
    'dstein64/vim-startuptime'
})

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

 -- use this if you want the onedark theme.
 
 -- use({
 --   'jessarcher/onedark.nvim',
 --   config = function()
 --     vim.cmd('colorscheme onedark')

 --     vim.api.nvim_set_hl(0, 'FloatBorder', {
 --       fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
 --       bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
 --     })
 --   end,
 -- })
 
use({
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark_dimmed')
  end
})

use ({
  "FabijanZulj/blame.nvim",
  config = function()
    require("blame").setup()
  end
})

use({
    'sbdchd/neoformat',
})

 use {
    'neoclide/coc.nvim',
    branch = 'master',
    run = 'npm ci',
    config = function ()
        vim.g.coc_global_extensions = {
          'coc-json',
          'coc-phpls',
          'coc-blade',
          'coc-lua',
        }
    end
}

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

