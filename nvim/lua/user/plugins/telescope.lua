local actions = require('telescope.actions')
local telescope = require('telescope')
local extensions = require('telescope').extensions
local builtin = require('telescope.builtin')

-- Telescope setup
telescope.setup({
    defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = '🔍 ',
        selection_caret = '⮕  ',
        layout_strategy = "horizontal",
        winblend = 0,
        file_ignore_patterns = { "/vendor/", "vendor/", "^vendor/", ".git/", "/.git/", "^.git/", "public/", "/public/", "^public/" },
        layout_config = {
            prompt_position = 'top',
        },
        sorting_strategy = 'descending',
    },
    pickers = {
        find_files = {
            files = true,
            hidden = true,
            theme = "dropdown",
        },
        buffers = {
            previewer = false,
            layout_config = {
                width = 120,
            },
        }
    },
    extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"                -- the default case_mode is "smart_case"
        }
    },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('env')

vim.api.nvim_set_keymap('n', '<Space>ff', ':lua require("telescope.builtin").find_files{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fg', ':lua require("telescope.builtin").live_grep{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fb', ':lua require("telescope.builtin").buffers{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fh', ':lua require("telescope.builtin").help_tags{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>env', ':Telescope env<CR>', { noremap = true, silent = true })
