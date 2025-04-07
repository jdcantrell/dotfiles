require("user/lazy_bootstrap")

require "user.options"
require "user.keymaps"
require "user.colorschemes"

require("lazy").setup("plugins", {
    ui = {
      border = "rounded"
    }
  })

-- to be moved to lazy plugins
-- require "user.completions"
require "user.treesitter"
require "user.harpoon"
