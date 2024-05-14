require("nvim-tree").setup({
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    adaptive_size = true,
    side = "right",
  },
  git = {
    enable = true,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {
      "node_modules",
      "vendor"
    },
  },
  renderer = {
        highlight_git = true,
        icons = {
        show = {
          git = true,
        },
    },
},
  filters = {
    dotfiles = false,
  }, 
})

vim.keymap.set('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>co', ':NvimTreeCollapse<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>r', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fl', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

