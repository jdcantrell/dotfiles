
local M = {
  'mfussenegger/nvim-lint',
}

function M.config()


  -- ember-tsc
  require('lint').linters.embertsc = {
    cmd = function()

      local local_binary = vim.fn.fnamemodify('./node_modules/.bin/' .. "ember-tsc", ':p')
      return local_binary
    end,
    stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
    append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
    args = {}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
    stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
    ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
    env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
    parser = require('lint.parser').from_errorformat('%f:%l:%c: - %m', {
      source = 'ember-tsc',
      severity = vim.diagnostic.severity.ERROR,
    }),
  }


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


  require('lint').linters.gostaticcheck = {
    cmd = function()
      return 'golangci-lint'
    end,
    stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
    args = {'--enable-only', 'staticcheck', '--no-config', '--output.json.path=stdout', '--path-mode=abs'}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
    stream = 'stdout', -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
    ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
    env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
    -- this should be in pyproject.toml
    -- linter_output_format="{filename}:{line}: {code} {message} {match}"
    parser = function(output, bufnr, cwd)
    if output == '' then
      return {}
    end
    local decoded = vim.json.decode(output)
    if decoded["Issues"] == nil or type(decoded["Issues"]) == 'userdata' then
      return {}
    end

    local diagnostics = {}
    for _, item in ipairs(decoded["Issues"]) do
      local curfile = vim.api.nvim_buf_get_name(bufnr)
      local curfile_abs = vim.fn.fnamemodify(curfile, ":p")
      local curfile_norm = vim.fs.normalize(curfile_abs)

      local lintedfile = cwd .. "/" .. item.Pos.Filename
      local lintedfile_abs = vim.fn.fnamemodify(lintedfile, ":p")
      local lintedfile_norm = vim.fs.normalize(lintedfile_abs)

      if curfile_norm == item.Pos.Filename or curfile_norm == lintedfile_norm then
        -- only publish if those are the current file diagnostics
        local sv = severities[item.Severity] or severities.warning
        table.insert(diagnostics, {
          lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
          col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
          end_lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
          end_col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
          severity = sv,
          source = item.FromLinter,
          message = item.Text,
        })
      end
    end
    return diagnostics
  end}

  require('lint').linters_by_ft = {
    typescript = { 'eslint',},
    javascript = { 'eslint',},
    typescriptreact = { 'eslint',},
    javascriptreact = { 'eslint',},
    --typescriptglimmer = { 'embertsc',},
    go = { 'golangcilint', 'gostaticcheck' },
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
