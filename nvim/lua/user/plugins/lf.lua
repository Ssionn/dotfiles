vim.g.lf_netrw = 1

local fn = vim.fn

require("lf").setup({
  default_action = "edit",
  winblend = 0,
  dir = "",
  direction = "float",
  border = "rounded",
  height = fn.float2nr(fn.round(0.80 * vim.o.lines)),
  width = fn.float2nr(fn.round(0.80 * vim.o.columns)),
  escape_quit = true,
  focus_on_open = true,
  mappings = true,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "LfTermEnter",
    callback = function(a)
        -- Set 'q' key in terminal mode to quit LF
        vim.api.nvim_buf_set_keymap(a.buf, "t", "q", [[<Cmd>q<CR>]], {nowait = true, noremap = true, silent = true})
    end,
})

vim.keymap.set('n', '<Space>e', ':Lf<CR>', { noremap = true, silent = true })

