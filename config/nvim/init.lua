require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorschemes"
require "user.completions"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"

vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    show_buffer_icons = false,
    diagnostics = "nvim_lsp",
  }
}

