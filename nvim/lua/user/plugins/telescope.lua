local actions = require('telescope.actions')
local telescope = require('telescope')
local extensions = require('telescope').extensions
local builtin = require('telescope.builtin')

-- Telescope setup
telescope.setup({
    defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = '🔍 ',
        selection_caret = '  ',
        layout_config = {
            prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        buffers = {
            previewer = false,
            layout_config = {
                width = 80,
            },
        }
    },
})

vim.api.nvim_set_keymap('n', '<Space>ff', ':lua require("telescope.builtin").find_files{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fg', ':lua require("telescope.builtin").live_grep{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fb', ':lua require("telescope.builtin").buffers{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fh', ':lua require("telescope.builtin").help_tags{}<CR>', { noremap = true, silent = true })
