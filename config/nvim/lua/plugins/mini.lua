

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
    buffer     = { suffix = 'b', options = {} },
    comment    = { suffix = 'c', options = {} },
    conflict   = { suffix = 'x', options = {} },
    diagnostic = { suffix = 'd', options = {} },
    diagnostic = { suffix = 'e', options = {severity = {min = vim.diagnostic.severity.INFO} }},
    diagnostic = { suffix = 'h', options = {severity = vim.diagnostic.severity.HINT} },
    file       = { suffix = 'f', options = {} },
    indent     = { suffix = 'i', options = {} },
    jump       = { suffix = 'j', options = {} },
    location   = { suffix = 'l', options = {} },
    oldfile    = { suffix = 'o', options = {} },
    quickfix   = { suffix = 'q', options = {} },
    treesitter = { suffix = 't', options = {} },
    undo       = { suffix = 'u', options = {} },
    window     = { suffix = 'w', options = {} },
    yank       = { suffix = 'y', options = {} },
    })
  require('mini.starter').setup()
end
return M
