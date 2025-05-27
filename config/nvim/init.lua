require("user/lazy_bootstrap")

require "user.options"
require "user.keymaps"
require "user.colorschemes"

require("lazy").setup("plugins", {
    ui = {
      border = "rounded"
    }
  })

require "user.treesitter"
require "user.harpoon"


-- at some point figure out a good home for this, glint isn't in lspconfig atm
vim.lsp.config["glint"] = {
  cmd = {'glint-language-server'},
  filetypes= { 'html.handlebars', 'handlebars', 'typescript.glimmer', 'javascript.glimmer' },
  root_markers = {
    '.glintrc.yml',
    '.glintrc',
    '.glintrc.json',
    '.glintrc.js',
    'glint.config.js',
    'package.json'
  },
};
vim.lsp.enable('glint');
