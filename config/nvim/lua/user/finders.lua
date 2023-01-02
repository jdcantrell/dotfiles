-- some more bs to make telescope nice
-- Dropdown list theme using a builtin theme definitions :

-- Find in neovim config with center theme
local finders = {
  fd_in_nvim = function()
    local opts = vim.deepcopy(center_list)
    opts.prompt_prefix = "Nvim>"
    opts.cwd = vim.fn.stdpath("config")
    require"telescope.builtin".fd(opts)
  end,

  fd_in_code = function()
    local opts = {
      preview = {
        hide_on_startup = true
      }
    }
    opts.prompt_prefix = "fd code>"
    opts.cwd = "/Users/john.cantrellopendoor.com/Work/code/" 
    require"telescope.builtin".fd(opts)
  end,

  -- Find files with_preview settings
  fd = function()
    local opts = {
      preview = {
        hide_on_startup = true
      }
    }
    opts.prompt_prefix = "fd>"
    require"telescope.builtin".fd(opts)
  end,

  grep_in_code = function()
    local opts = {}
    opts.prompt_prefix = "rg code>"
    opts.cwd = "/Users/john.cantrellopendoor.com/Work/code/" 
    require"telescope.builtin".live_grep(opts)
  end,

  -- Find files with_preview settings
  grep = function()
    local opts = {}
    opts.prompt_prefix = "rg>"
    require"telescope.builtin".live_grep(opts)
  end,

  grep_string = function()
    local opts = {}
    opts.prompt_prefix = "rg>"
    require"telescope.builtin".grep_string(opts)
  end,
}

return finders
