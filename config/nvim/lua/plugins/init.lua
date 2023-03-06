return {
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  {"rcarriga/nvim-notify"},
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  },
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  {
    "folke/tokyonight.nvim",
  },
  { "marko-cerovac/material.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin"
  },
  {
    "uloco/bluloco.nvim",
    dependencies = {
      'rktjmp/lush.nvim'
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme bluloco]])
    end,
  },
  { "loctvl842/monokai-pro.nvim" },
 	{ 'talha-akram/noctis.nvim' },
  { "rebelot/kanagawa.nvim",
  },
  { "Shatur/neovim-ayu" },
  { 'sainnhe/everforest' },

  {"preservim/vim-markdown"},
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {
      hijack_netrw = true,
      git = {
        ignore = true
      },
    } end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require'lualine'.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {{ 'mode', fmt = function(str) return str:sub(1,1) end } },
        lualine_b = {},
        lualine_c = {
          {'branch', icon=''},
          {
            'diff',
            symbols = {
              added = ' ',
              modified = ' ',
              removed = ' ',
            },
          },
          'diagnostics'
        },
        lualine_x = {},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
          },
        },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      winbar = {},
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            file_status = false,
            newfile_status = false,
            path = 3,
          },
        },
        lualine_x = {
          {
            'indicator',
            color = function()
              if (vim.bo.readonly) then
                  return { fg = 'Red' }
              end
              return { fg = '#7BE6AB' }
            end,
            fmt = function()
              if (vim.bo.readonly) then
                  return ''
              end
              if (vim.bo.modified) then
                  return '●'
              end
              return ' '
            end,
          },
          {
            'encoding',
            cond = function()
              return vim.bo.fileencoding ~= 'utf-8'
            end,
          },
          {
            'fileformat',
            cond = function()
              return vim.bo.fileformat ~= 'unix'
            end,
            symbols = {
              unix = 'unix', -- e712
              dos = 'dos',  -- e70f
              mac = 'mac',  -- e711
            }
          },
          'filetype',
        },
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {}
    } end
  },


  {"hrsh7th/nvim-cmp"}, -- The completion plugin
  {"hrsh7th/cmp-buffer"}, -- buffer completions
  {"hrsh7th/cmp-path"}, -- path completions
  {"hrsh7th/cmp-cmdline"}, -- cmdline completions
  {"saadparwaiz1/cmp_luasnip"}, -- snippet completions
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-nvim-lua"},

  -- snippets
  {"L3MON4D3/LuaSnip"}, --snippet engine
  {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use

  -- LSP
  {"neovim/nvim-lspconfig"}, -- enable LSP
  {"williamboman/nvim-lsp-installer"}, -- simple to use language server installer
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "p00f/nvim-ts-rainbow" },
  { "nvim-treesitter/playground" },
  {'nvim-treesitter/nvim-treesitter-context',
    config = function ()
      require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
                'class',
                'function',
                'method',
                -- 'for', -- These won't appear in the context
                -- 'while',
                -- 'if',
                -- 'switch',
                -- 'case',
            },
        },
    }
    end
  },

  -- actually good indent?
  { "sheerun/vim-polyglot" },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        detection_methods = { "pattern", "lsp" },
        silent_chdir = true,

      }
    end
  },

  { "mbbill/undotree" },

  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require("toggleterm").setup()
    end
  },
  { "mong8se/actually.nvim" },
}

