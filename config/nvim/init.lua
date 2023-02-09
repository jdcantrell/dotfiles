require("user/lazy_bootstrap")

require "user.options"
require "user.keymaps"
require "user.colorschemes"

require("lazy").setup("plugins")

-- to be moved to lazy plugins
require "user.completions"
require "user.lsp"
require "user.finders"
require "user.treesitter"
