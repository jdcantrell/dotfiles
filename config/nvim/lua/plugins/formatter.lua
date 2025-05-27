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
      javascript = { "biome", "prettier" },
      typescript = { "biome", "prettier" },
      typescriptreact = { "biome", "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      go = { "goimports", "gofmt" },
      racket = { "raco_fmt" },
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
        -- command = "/usr/local/bin/prettier",
        exit_codes = { 0, 1 }, -- ignore errors for files with syntax issues
      },
      raco_fmt = {
          command = "raco",
          args = { "fmt", "-i", "$FILENAME" },
          stdin = false,
      },
      gofmt = {
        args = { "-r", "interface{} -> any" }
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

return M
