local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()

-- https://github.com/jose-elias-alvarez/null-ls.nvim
local null_ls = require("null-ls")
local diagnostics_format = "[#{c}] #{m} (#{s})"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
null_ls.setup({
  handlers = handlers,
  flags = flags,
  capabilities = capabilities,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
          vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]])
      end
  end,
  sources = {
    -- cspell
    diagnostics.cspell.with({
      diagnostics_format = diagnostics_format,
      condition = function(utils)
        return utils.root_has_file({ "cspell.json", "cspell.config.yaml", "cspell.config.cjs" })
      end,
    }),
    -- python
    diagnostics.flake8.with({
      diagnostics_format = diagnostics_format,
      prefer_local = ".venv/bin",
      -- Ignore some errors that are always fixed by black
      extra_args = { "--extend-ignore", "E1,E2,E3,F821,E731,R504,SIM106" },
    }),
    formatting.isort.with({
      diagnostics_format = diagnostics_format,
      prefer_local = ".venv/bin",
      extra_args = { "--profile", "black" },
    }),
    formatting.black.with({
      diagnostics_format = diagnostics_format,
      prefer_local = ".venv/bin",
      -- extra_args = { "--fast", "-W", "6" },
    }),
    -- djhtml
    formatting.djhtml.with({
      diagnostics_format = diagnostics_format,
      prefer_local = "node_modules/.bin",
    }),
    -- javascript/typescript
    formatting.prettier.with({
      diagnostics_format = diagnostics_format,
      prefer_local = "node_modules/.bin",
    }),
  },
})
