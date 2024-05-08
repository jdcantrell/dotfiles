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
    format_on_save = function(bufnr)
      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local function on_format(err)
        if err and err:match("timeout$") then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 200, lsp_fallback = true }, on_format
    end,

    format_after_save = function(bufnr)
      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      vim.b.format_in_progress = true
      return { lsp_fallback = true, callback = function() vim.b.format_in_progress = false end }
    end,

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

-- function M.config()
--   local slow_format_filetypes = {}
--   require("conform").setup({
--     format_on_save = function(bufnr)
--       if slow_format_filetypes[vim.bo[bufnr].filetype] then
--         return
--       end
--       local function on_format(err)
--         if err and err:match("timeout$") then
--           slow_format_filetypes[vim.bo[bufnr].filetype] = true
--         end
--       end
--
--       return { timeout_ms = 200, lsp_fallback = false }, on_format
--     end,
--
--     format_after_save = function(bufnr)
--       if not slow_format_filetypes[vim.bo[bufnr].filetype] then
--         return
--       end
--       return { lsp_fallback = false }
--     end,
--   })
--
--   -- setup Format command
--   vim.api.nvim_create_user_command("Format", function(args)
--     local range = nil
--     if args.count ~= -1 then
--       local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
--       range = {
--         start = { args.line1, 0 },
--         ["end"] = { args.line2, end_line:len() },
--       }
--     end
--     require("conform").format({ async = true, lsp_fallback = false, range = range })
--   end, { range = true })
-- end

-- function M.config()
-- local util = require "formatter.util"
-- require('formatter').setup {
--   filetype = {
--     markdown = {
--       function ()
--         return {
--           exe = "prettier",
--           args = {
--             "--stdin-filepath",
--             "--prose-wrap always",
--             util.escape_path(util.get_current_buffer_file_path()),
--           },
--           stdin = true,
--           try_node_modules = false,
--         }
--       end
--     },
--     html = {
--       require('formatter.filetypes.html').prettier,
--     },
--     htmldjango = {
--        function()
--         -- Full specification of configurations is down below and in Vim help
--         -- files
--         return {
--           exe = "djlint",
--           args = {
--             "-",
--             "--reformat",
--           },
--           stdin = true,
--         }
--       end
--     },
--     javascript = {
--       require('formatter.filetypes.javascript').prettier,
--     },
--     css = {
--       require('formatter.filetypes.css').prettier,
--     },
--     scss = {
--       require('formatter.filetypes.css').prettier,
--     },
--     typescriptreact = {
--       function ()
--       return {
--           exe = "prettier",
--           args = {
--             "--stdin-filepath",
--             util.escape_path(util.get_current_buffer_file_path()),
--             "--parser",
--             "typescript",
--           },
--           stdin = true,
--           try_node_modules = false,
--         }
--       end ,
--  --     require('formatter.filetypes.typescriptreact').prettier,
--     },
--     json = {
--       require('formatter.filetypes.json').prettier,
--     },
--     typescript = {
--       require('formatter.filetypes.typescript').prettier,
--       -- function()
--       --   return {
--       --     try_node_modules = false,
--       --   }
--       -- end
--       function ()
--       return {
--           exe = "prettier",
--           args = {
--             "--stdin-filepath",
--             util.escape_path(util.get_current_buffer_file_path()),
--             "--parser",
--             "typescript",
--           },
--           stdin = true,
--           try_node_modules = false,
--         }
--       end ,
--     },
--     ts = {
--       require('formatter.filetypes.typescript').prettier,
--     },
--     go = {
--       require("formatter.filetypes.go").gofmt
--     },
--     python = {
--       require("formatter.filetypes.python").black
--     }
--   }
-- }

--   vim.api.nvim_exec([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.md,*.html,*.py,*.js,*.ts,*.jsx,*.tsx,*.go,*.css,*.json,*.scss silent! FormatWrite
--   augroup END
--   ]], true)
-- end

return M
