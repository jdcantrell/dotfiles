local slow_format_filetypes = {}
local M = {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  -- keys = {
  --   {
  --     -- Customize or remove this keymap to your liking
  --     "<leader>f",
  --     function()
  --       require("conform").format({ async = true, lsp_fallback = true })
  --     end,
  --     mode = "",
  --     desc = "Format buffer",
  --   },
  -- },
  --
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black", "ruff" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      go = { "goimports" },
    },
    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.INFO,
    -- Set up format-on-save
    format_after_save = {
      lsp_form= "fallback"
    },
    -- Customize formatters
    formatters = {
      prettier = {
        command = "/usr/local/bin/prettier",
        exit_codes = { 0, 1 }, -- ignore errors for files with syntax issues
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

return M
