-- Ensure Packer is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
require('packer').reset()

require('packer').init({
    compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'solid' })
        end,
    },
})

local use = require('packer').use

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Utility Plugins
use('tpope/vim-commentary')
use('tpope/vim-surround')
use('tpope/vim-unimpaired')
use('tpope/vim-sleuth')
use('tpope/vim-repeat')
use('christoomey/vim-tmux-navigator')
use('ethanholz/nvim-lastplace')
use('jessarcher/vim-heritage')

-- Neoscroll for smooth scrolling
use({
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end,
})

-- Splitjoin for switching between single-line and multiline code
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_html_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end,
})

-- Vim Pasta for better paste behavior
use({
    'sickill/vim-pasta',
    config = function()
        vim.g.paste_disabled_filetypes = { 'fugitive' }
    end,
})

-- Treesitter for syntax highlighting and more
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

-- Telescope for fuzzy finding and more
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
    config = function()
        require('user/plugins/telescope')
    end,
})

-- Noice for enhancing UI messages
use({
    'folke/noice.nvim',
    config = function()
        require('user/plugins/noice')
    end,
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
})

-- LF File Manager Integration
use({
    'lmburns/lf.nvim',
    config = function()
        require('user/plugins/lf')
    end,
    requires = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" }
})

-- Vim Startup Time
use({
    'dstein64/vim-startuptime'
})

-- Feline Status Line
use({
    'feline-nvim/feline.nvim',
    config = function()
        require('user/plugins/feline')
    end
})

-- Barbar Bufferline
use({
    'romgrk/barbar.nvim',
    config = function()
        require('user/plugins/barbar')
    end
})

-- Theme: Rose Pine
use({
    'rose-pine/neovim',
    config = function()
        require('rose-pine').setup({
            variant = 'dawn',
            dark_variant = 'moon',
        })

        vim.cmd('colorscheme rose-pine')
    end
})

-- Blame Line Plugin
use({
    "FabijanZulj/blame.nvim",
    config = function()
        require("blame").setup()
    end
})

-- Neoformat for code formatting
use({
    'sbdchd/neoformat',
})

-- Coc.nvim for LSP and completion
use {
    'neoclide/coc.nvim',
    branch = 'master',
    run = 'npm ci',
    config = function()
        vim.g.coc_global_extensions = {
            'coc-html',
            'coc-json',
            '@yaegassy/coc-intelephense',
            'coc-blade',
            'coc-lua',
        }
    end
}

-- PHP Actor for PHP development
use({
    'phpactor/phpactor',
    ft = 'php',
    run = 'composer install --no-dev --optimize-autoloader',
    config = function()
        vim.keymap.set('n', '<Space>pm', ':PhpactorContextMenu<CR>')
        vim.keymap.set('n', '<Space>pn', ':PhpactorClassNew<CR>')
    end,
})

-- Git Integration with Gitsigns
use({
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
    end,
})


-- Git Commands with Fugitive
use({
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb',
})

-- Sync Packer if it was just installed
if packer_bootstrap then
    require('packer').sync()
end

-- Auto Commands for Packer
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
    augroup end
]])
