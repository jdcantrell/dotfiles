return {
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  {"rcarriga/nvim-notify"},
  {
    'j-hui/fidget.nvim',
    branch = 'legacy',
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
  {'Verf/deepwhite.nvim'},
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  { "EdenEast/nightfox.nvim" },
  { "marko-cerovac/material.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin"
  },
  { "ribru17/bamboo.nvim" },
  {
    "mcchrish/zenbones.nvim",
    dependencies= "rktjmp/lush.nvim"
  },
  {
    "uloco/bluloco.nvim",
    dependencies = {
      'rktjmp/lush.nvim'
    },
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


  -- {"hrsh7th/nvim-cmp",
  --   dependencies="onsails/lspkind.nvim" 
  -- }, -- The completion plugin

  -- lsp
  { "onsails/lspkind.nvim"},
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = function ()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end
  },
  {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use
  {"hrsh7th/cmp-buffer"}, -- buffer completions
  {"hrsh7th/cmp-path"}, -- path completions
  {"hrsh7th/cmp-cmdline"}, -- cmdline completions
  {"saadparwaiz1/cmp_luasnip"}, -- snippet completions
  {"hrsh7th/cmp-nvim-lua"},

  -- LSP
  -- {
  --   "williamboman/mason.nvim", config = function () 
  --     require('mason').setup({
  --         border = 'rounded'
  --       })
  --     end
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim", config = function ()
  --     require('mason-lspconfig').setup({
  --         ensure_installed = {
  --           "tsserver",
  --         },
  --         automatic_installation = true,
  --       })

  --       require("mason-lspconfig").setup_handlers {
  --           -- The first entry (without a key) will be the default handler
  --           -- and will be called for each installed server that doesn't have
  --           -- a dedicated handler.
  --           function (server_name) -- default handler (optional)
  --               require("lspconfig")[server_name].setup {}
  --           end,
  --       }
  --     end
  -- },
  -- {"neovim/nvim-lspconfig"}, -- enable LSP
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
  { "vim-scripts/LargeFile" },
}

