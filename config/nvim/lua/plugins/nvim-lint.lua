
local M = {
  'mfussenegger/nvim-lint',
}

function M.config()

  local eslint = require('lint').linters.eslint
  eslint.cmd = 'npx'
  eslint.args = {'eslint',
    '--format',
    'json',
    '--stdin',
    '--stdin-filename',
    function() return vim.api.nvim_buf_get_name(0) end,
  }

  -- This occasionally useful linter can be ran adhoc using :Lint (when filetype=htmldjango)
  require('lint').linters.htmldjango = {
    cmd = function()
      return 'djlint'
    end,
    stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
    args = {'--profile=jinja'}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
    stream = 'stdout', -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
    ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
    env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
    -- this should be in pyproject.toml
    -- linter_output_format="{filename}:{line}: {code} {message} {match}"
    parser = require('lint.parser').from_pattern(
      [[(%w+) (%d+):(%d+) (.*).]],
      { "code", "lnum", "col", "message" },
      { source='djlint', severity=vim.diagnostic.severity.WARN}
    )
  }

  require('lint').linters_by_ft = {
    typescript = { 'eslint',},
    javascript = { 'eslint',},
    typescriptreact = { 'eslint',},
    javascriptreact = { 'eslint',},
    go = { 'golangcilint' },
  }

  vim.api.nvim_exec([[
    autocmd BufRead,BufWritePost * lua require('lint').try_lint()
  ]], true)

  vim.api.nvim_create_user_command(
    'Lint',
    function(input)
      local type = input.args
      if type == nil or type == '' then
        type = vim.bo.filetype
      end
      require('lint').try_lint(type)
    end,
    { nargs='?' }
  )
end
return M
