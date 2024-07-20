require('nvim-treesitter.configs').setup({
   ensure_installed = 'all',
   highlight = {
     enable = true,
     additional_vim_regex_highlighting = true,
   },

   context_commentstring = {
     enable = true,
   }
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

-- Set the filetype for *.blade.php files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "blade"
  end
})
