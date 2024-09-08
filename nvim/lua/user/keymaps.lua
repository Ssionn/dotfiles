-- Set space as leader key
vim.g.mapleader = " "

-- Keymap utility
local keyset = vim.keymap.set

-- Quickly clear search highlighting
keyset('n', '<leader>k', ':nohlsearch<CR>')

-- Buffer management
keyset('n', '<leader>w', ':bd<CR>', { noremap = true, silent = true }) -- Close current buffer
keyset('n', '<leader>Q', ':bufdo bdelete<CR>')                         -- Close all buffers

-- File handling
keyset('', 'gf', ':edit <cfile><CR>')            -- Allow gf to open non-existent files
keyset('n', '<leader>x', ':!xdg-open %<CR><CR>') -- Open current file in default program

-- Visual mode mappings
keyset('v', '<', '<gv')   -- Reselect visual selection after indenting
keyset('v', '>', '>gv')
keyset('v', 'y', 'myy`y') -- Maintain cursor position when yanking
keyset('v', 'Y', 'myY`y')
keyset('v', '<leader>y', '"+y')
keyset('n', '<leader>Y', '"+Y')
keyset('v', 'p', '"_dP') -- Paste replace visual selection without copying

-- Navigation enhancements
keyset('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true }) -- Move by terminal rows if no count is provided
keyset('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

keyset('n', ']h', ':Gitsigns next_hunk<CR>')
keyset('n', '[h', ':Gitsigns prev_hunk<CR>')
keyset('n', 'gs', ':Gitsigns stage_hunk<CR>')
keyset('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
keyset('n', 'gp', ':Gitsigns preview_hunk<CR>')
keyset('n', 'gb', ':Gitsigns blame_line<CR>')

-- Insert mode enhancements
keyset('i', ';;', '<Esc>A;<Esc>') -- Insert trailing semicolon
keyset('i', ',,', '<Esc>A,<Esc>') -- Insert trailing comma

-- Command line adjustments
keyset('n', 'q:', ':q<CR>') -- Disable annoying command line thing

-- CoC mappings
keyset('i', '<TAB>',
  [[coc#pum#visible() ? coc#pum#next(1) : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<TAB>"]],
  { silent = true, noremap = true, expr = true, replace_keycodes = false })
keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
  { silent = true, noremap = true, expr = true, replace_keycodes = false })
keyset('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  { silent = true, noremap = true, expr = true, replace_keycodes = true })

-- CoC navigation
keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Formatting
keyset('n', '<leader>p', ":call CocAction('format')<CR>", { noremap = true, silent = true })

-- Blame the other person simulator
keyset('n', '<leader>bl', ":Blame<CR>", { noremap = true, silent = true })
