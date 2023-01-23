require('lint').linters.tslint = {
  cmd = function()
    local local_eslint = vim.fn.fnamemodify('./node_modules/.bin/tslint', ':p')
    local stat = vim.loop.fs_stat(local_eslint)
    if stat then
      return local_eslint
    end
    return 'tslint'
  end,
  stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
  args = {'--format','prose'}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  stream = 'both', -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
  parser = require('lint.parser').from_errorformat('ERROR: %f:%l:%c - %m', { source='tslint', severity=vim.diagnostic.severity.WARN}) 
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
  typescript = {'eslint',},
  javascript = {'eslint',},
  typescriptreact = {'eslint',},
  javascriptreact = {'eslint',},
  -- htmldjango = {'djlint',},
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
-- :command! -nargs=1 Upper echo toupper(<q-args>)

