

local M = {
  'echasnovski/mini.nvim',
  version = false
}

function M.config()
  require('mini.basics').setup()
  require('mini.ai').setup()
  require('mini.surround').setup()
  require('mini.trailspace').setup({
    only_in_normal_buffers =true,
  })

  vim.api.nvim_set_hl(0, "MiniTrailspace", { ctermbg=0, bg="#194670", fg="#1946ff"})

  require('mini.jump').setup()
  require('mini.bracketed').setup({
    diagnostic = { suffix = 'd', options = {severity = vim.diagnostic.severity.ERROR} },
    })
  require('mini.starter').setup()
  require('mini.notify').setup()
end
return M
