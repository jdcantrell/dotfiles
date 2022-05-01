local util = require "formatter.util"
require('formatter').setup {
    filetype = {
      javascript = {
        function()
          return {
           exe = "prettier",
            args = {
              "--stdin-filepath",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
          }
        end
      },
      typescriptreact = {
        function()
          return {
           exe = "prettier",
            args = {
              "--stdin-filepath",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
          }
        end
      },
      typescript = {
        function()
          return {
           exe = "prettier",
            args = {
              "--stdin-filepath",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
          }
        end
      },
      python = {
        function()
          return {
            exe = "black",
            args = { "-q", "-" },
            stdin = true,
          }
        end
      }
    }
  }

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.js,*.ts,*.jsx,*.tsx FormatWrite
augroup END
]], true)
