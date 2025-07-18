return {
  --quality of life
  { "tpope/vim-abolish" },
  -- ui improvements
  { "vim-scripts/LargeFile" },
  { "mbbill/undotree" },
  { "mong8se/actually.nvim" },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        detection_methods = { "pattern", "lsp" },
        patterns = { "!code/parcel/app", "!code/parcel/packages"},
        silent_chdir = true,

      }
    end
  },


  -- doesn't work yet, some bug with ver
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {
        "folke/snacks.nvim",
        opts = {
          terminal = {},
        }
      }
    },
    event = "LspAttach",
    opts = {
      backend = "delta",
      picker = "snacks",
    },
  },

  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require("toggleterm").setup()
    end,
    cmd = { "ToggleTerm" }
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    cmd = { "Trouble" }, -- lazy loads on these commands
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'lualine'.setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
          lualine_b = {},
          lualine_c = {
            { 'branch', icon = '' },
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
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              'filename',
            },
          },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        winbar = {
        },
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
                dos = 'dos',   -- e70f
                mac = 'mac',   -- e711
              }
            },
            'filetype',
          },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = {}
      }
    end
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      styles = {},
       picker = {
        marks = {
          transform = function(item)
            if item.label and item.label:match("^[A-I]$") and item then
              item.label = "" .. string.byte(item.label) - string.byte("A") + 1 .. ""
              return item
            end
            return false
          end,
        },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            }
          },
        },
      },
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      words = { enabled = false },
    },
  },
  { 'Verf/deepwhite.nvim' },
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable", -- versioned tags + docs updates from main
    config = function()
      vim.g.lavender = {
        transparent = {
          background = false, -- do not render the main background
          float      = false, -- do not render the background in floating windows
          popup      = false, -- do not render the background in popup menus
          sidebar    = false, -- do not render the background in sidebars
        },
        contrast = true, -- colour the sidebar and floating windows differently to the main background

        italic = {
          comments  = false, -- italic comments
          functions = false, -- italic function names
          keywords  = false, -- italic keywords
          variables = false, -- italic variables
        },

        signs = true, -- use icon (patched font) diagnostic sign text
        overrides = {
          theme = {
            String = { fg = "green", italic = false },
            CursorLine = { bold = false, italic = false, bg="#2e2d4a" },
          }
        },
      }
    end,
  },
  { "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd([[set background=dark]])
      vim.cmd([[colorscheme tokyonight]])
    end
  },
   {
     "ribru17/bamboo.nvim",
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
  },
  { 'talha-akram/noctis.nvim' },
  { "eldritch-theme/eldritch.nvim", },
  { "rebelot/kanagawa.nvim", },
  { "Shatur/neovim-ayu",
  --config = function()
    --  local colors = require('ayu.colors')
    --  colors.generate() -- Pass `true` to enable mirage
    --  require('ayu').setup({
      --    overrides = {
        --      LineNr = { fg = colors.comment },
        --      NonText = { fg = colors.comment },
        --    }
        --  })
        --end,
  },

  { 'sainnhe/everforest' },
  { "EdenEast/nightfox.nvim",
    config = function()

      -- make dawnfox be noctis lux
      local palettes = {
        dawnfox = {
          --black, red, green, yellow, blue, magenta, cyan, white, orange, pink
          black = "#005661",
          red = "#e66533",
          green = "#16b673",
          yellow = "#d5971a",
          blue = "#49ace9", -- struct props
          magenta = "#7060eb", -- cornflower blue
          cyan = {base= "#49d6e9", dim="#d5971a", bright="#00ff00"}, -- Keyword autocomplete dropdown
          white = "#e66533",
          orange = "#d67e5c",
          pink = "#df769b",

          --bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
          fg0 = "#005661",
          -- autocomplete background
          sel0 = "#f9f1e1",
          -- search highlight background
          sel1 = "#daeeee",
          comment = "#5b858b",
          -- cmd background
          bg0 = "#f9f1e1",
          -- editor background
          bg1 = "#fef8ec",
          -- current line background
          bg3 = "#daeeee",

          bg2 = "#8a8679",
          bg4 = "#8a8679",


          -- line numbers
          fg3 = "#005661",
          -- top status bar - operators - braces
          fg2 = "#005661",
          -- bottom status bar + float windows - search text
          --fg1 = "#8a8679",
          fg1 = "#8a8679",
        }
      }

      require("nightfox").setup({ palettes = palettes })
    end
  },

  { "olimorris/onedarkpro.nvim" },
   { "webhooked/kanso.nvim"},
   { "bluz71/vim-nightfly-colors", name = "nightfly", },


  -- language improvements
  { "preservim/vim-markdown" },

  --- racket
  { "benknoble/vim-racket" },
  { "Olical/conjure",
    cmd = { "ConjureEvalBuf" }
  },

  -- lsp
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      'williamboman/mason.nvim'
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require('lspconfig')[server_name].setup({capabilities = capabilities})
          end,
          ["glint"] = function ()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config('glint') {
              cmd = {'~/.local/share/nvim/mason/bin/glint-language-serve'},
              filetypes= { 'html.handlebars', 'handlebars', 'typescript.glimmer', 'javascript.glimmer' },
              root_markers = {
                '.glintrc.yml',
                '.glintrc',
                '.glintrc.json',
                '.glintrc.js',
                'glint.config.js',
                'package.json'
              },
              capabilities = capabilities,
            };
            vim.lsp.enable('glint');

          end
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    config = function()
    end,
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {},
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- probably need to do this above in mason-lspconfig
      servers = {},
    },
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      cmdline = {
        keymap = {
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
          ['<Tab>'] = { 'show', 'select_next', 'fallback' },
          ['<CR>'] = { 'hide', 'fallback' },
        },
        completion = {
          list = {
            selection = {
              preselect = false
            }
          }
        }
      },
      keymap = {
        preset = 'default',
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ["<CR>"] = { "accept", "fallback" },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation'},
      },
      cmdline = {
        completion = {
          list = {
            selection = {
              preselect = false
            }
          }
        }
      },
      completion = {
        list = {
         selection = {
            preselect = false,
            auto_insert = false,
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 1000,
          window = { border = 'rounded' } ,
        },
        menu = {
          auto_show = true,
          border = 'rounded',
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 }
            },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
                -- Optionally, you may also use the highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              }
            },
          },
        },
      },
      signature = { window = { border = 'rounded' } },
      appearance = {
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" }
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()

      require("nvim-treesitter.configs").setup {
        ensure_installed = {'go', 'typescript', 'javascript', 'css', 'markdown', 'python', 'html', 'json' },
        sync_install = false,
        ignore_install = { "" }, -- List of parsers to ignore installing
        autopairs = {
          enable = true,
        },
        highlight = {
          enable = true, -- false will disable the whole extension
          additional_vim_regex_highlighting = true,

        },
        indent = { enable = false },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
        multiline_threshold = 1,
        patterns = {   -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
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
  { "aaronik/treewalker.nvim",
    config = function()
      local tw = require('treewalker')
      vim.keymap.set('n', '<S-Down>', tw.move_down, { noremap = true })
      vim.keymap.set('n', '<S-Up>', tw.move_up, { noremap = true })
      vim.keymap.set('n', '<S-Left>', tw.move_out, { noremap = true })
      vim.keymap.set('n', '<S-Right>', tw.move_in, { noremap = true })
    end
  },

  -- fun
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  }

}
