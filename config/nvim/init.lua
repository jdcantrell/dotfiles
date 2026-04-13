require("user/lazy_bootstrap")

require "user.options"
require "user.keymaps"

require("lazy").setup("plugins", {
    ui = {
      border = "rounded"
    }
  })

require "user.harpoon"


local default_capabilities = vim.lsp.protocol.make_client_capabilities()
local blink_capabilities = require('blink.cmp').get_lsp_capabilities()

local capabilities = vim.tbl_deep_extend(
  'force', -- This makes the second table (blink) overwrite keys if they conflict
  default_capabilities,
  blink_capabilities
)

vim.lsp.config('*', {
  capabilities = capabilities,
})

-- setup typescript and glint lsp
-- require "user.typescript"

vim.lsp.enable({ "gopls", "ruff"})
