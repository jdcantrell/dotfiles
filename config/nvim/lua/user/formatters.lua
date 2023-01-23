local util = require "formatter.util"
require('formatter').setup {
  filetype = {
    markdown = {
      function () 
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            "--prose-wrap always",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end
    },
    html = {
      require('formatter.filetypes.html').prettier,
    },
    htmldjango = {
       function()
        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "djlint",
          args = {
            "-",
            "--reformat",
          },
          stdin = true,
        }
      end   
    },
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    css = {
      require('formatter.filetypes.css').prettier,
    },
    scss = {
      require('formatter.filetypes.css').prettier,
    },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },
    json = {
      require('formatter.filetypes.json').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
    ts = {
      require('formatter.filetypes.typescript').prettier,
    },
    go = {
      require("formatter.filetypes.go").gofmt
    },
    python = {
      require("formatter.filetypes.python").black
    }
  }
}

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.md,*.html,*.py,*.js,*.ts,*.jsx,*.tsx,*.go,*.css,*.json,*.scss silent! FormatWrite
augroup END
]], true)
