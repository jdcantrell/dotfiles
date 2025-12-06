require("user/lazy_bootstrap")

require "user.options"
require "user.keymaps"

require("lazy").setup("plugins", {
    ui = {
      border = "rounded"
    }
  })

-- to be moved to lazy plugins
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

-- vim.lsp.config('ts_ls', {
--   filetypes = {
--     'typescript',
--     'typescript.glimmer',
--     'javascript',
--     'javascript.glimmer',
--   },
-- })
--
local glint_plugin = {
  name = "@glint/tsserver-plugin",
  location = "/Users/jdcantrell/.local/share/mise/installs/node/22.16.0/lib/node_modules/",
}
vim.lsp.config("vtsls", {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          glint_plugin,
        },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
vim.lsp.enable({ "vtsls", "glintv2", "gopls", "ruff"})
