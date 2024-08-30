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

use 'wbthomason/packer.nvim'
use('tpope/vim-commentary')
use('tpope/vim-surround')
use('tpope/vim-unimpaired')
use('tpope/vim-sleuth')
use('tpope/vim-repeat')
use('christoomey/vim-tmux-navigator')
use('ethanholz/nvim-lastplace')
use('jessarcher/vim-heritage')

use({
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
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

-- use({
--     'kyazdani42/nvim-tree.lua',
--     requires = {
--         'kyazdani42/nvim-web-devicons',
--     },
--     config = function ()
--         require('user/plugins/nvim-tree')
--     end,
--     lazy = true
-- })

use({
    'lmburns/lf.nvim',
    config = function()
        require('user/plugins/lf')
    end,
    requires = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" }
})

use({
    'dstein64/vim-startuptime'
})

use({
    'feline-nvim/feline.nvim',
    config = function()
        require('user/plugins/feline')
    end
})

use({
    'romgrk/barbar.nvim',
    config = function()
        require('user/plugins/barbar')
    end
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
    'rose-pine/neovim',
    config = function()
        require('rose-pine').setup({
            variant = 'dawn',
            dark_variant = 'moon',

            -- palette = {
            --     dawn = {
            --         base = '#f0f4f8', -- Slightly darker than the original dawn base color
            --         overlay = '#e5e9f0', -- Slightly darker overlay
            --     },
            -- },
        })

        vim.cmd('colorscheme rose-pine')
    end
})

use({
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
    config = function()
        vim.g.coc_global_extensions = {
            'coc-json',
            '@yaegassy/coc-intelephense',
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

if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
    augroup end
]])
