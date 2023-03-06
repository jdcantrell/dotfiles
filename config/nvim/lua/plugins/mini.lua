

local M = {
  'echasnovski/mini.nvim',
  version = false
}

function M.config()
  require('mini.ai').setup()
  require('mini.surround').setup()
  require('mini.trailspace').setup()
  require('mini.jump').setup()
  require('mini.basics').setup()
  require('mini.bracketed').setup()
  require('mini.starter').setup()
end
return M
