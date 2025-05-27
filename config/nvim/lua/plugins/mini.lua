local M = {
  'echasnovski/mini.nvim',
  version = false
}

function M.config()
  require('mini.ai').setup()
  require('mini.basics').setup()
  require('mini.bracketed').setup({
    diagnostic = { suffix = 'd', options = { severity = vim.diagnostic.severity.ERROR } },
  })
  require('mini.diff').setup()
  require('mini.jump').setup()
  require('mini.icons').setup()
  require('mini.notify').setup({
    window = {
      config = {
        border = 'rounded'
      }
    }
  })
  require('mini.starter').setup()
  require('mini.surround').setup()
  require('mini.trailspace').setup({
    only_in_normal_buffers = true,
  })
  vim.api.nvim_set_hl(0, "MiniTrailspace", { ctermbg = 0, bg = "#194670", fg = "#1946ff" })

  vim.api.nvim_exec([[
    autocmd BufWritePre * lua MiniTrailspace.trim()
  ]], true)

  require('mini.files').setup({
    mappings = {
      go_in_plus = 'l',
      go_in = 'L',
      go_out = 'H',
      go_out_plus = 'h'
    }
  })

  require('mini.misc').setup()

  -- MiniMisc.setup_auto_root()
  MiniMisc.setup_termbg_sync()

  vim.api.nvim_set_keymap("n", "<leader>e",
    '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', { silent = true })
end

return M
