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

  {
    "fnune/recall.nvim",
    version = "*",
    config = function()
      local recall = require("recall")

      recall.setup({})

      vim.keymap.set("n", "mm", recall.toggle, { noremap = true, silent = true })
      vim.keymap.set("n", "mn", recall.goto_next, { noremap = true, silent = true })
      vim.keymap.set("n", "mp", recall.goto_prev, { noremap = true, silent = true })
      vim.keymap.set("n", "mc", recall.clear, { noremap = true, silent = true })
      vim.keymap.set("n", "ml", require("recall.snacks").pick, { noremap = true, silent = true })
    end
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
      statuscolumn = { enabled = true },
      words = { enabled = false },
    },
     keys = {
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>gg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>gw", function() Snacks.picker.grep_word() end, desc = "Grep Word" },

      { "<leader>fc", function() Snacks.picker.files({ cwd = "~/code" }) end, desc = "Find in Code" },
      { "<leader>gc", function() Snacks.picker.grep({ cwd = "~/code" }) end, desc = "Grep in Code" },
    },

  },

  -- themes
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
  {"kepano/flexoki-neovim"},
  { "folke/tokyonight.nvim" },
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
  { "loctvl842/monokai-pro.nvim" },
  { 'talha-akram/noctis.nvim' },
  { "eldritch-theme/eldritch.nvim", },
  { "rebelot/kanagawa.nvim", },
  {{ "Shatur/neovim-ayu",
    --config = function()
    --  local colors = require('ayu.colors')
    --  colors.generate() -- Pass `true` to enable mirage
    --  vim.cmd([[set background=dark]])
    --  require('ayu').setup({
    --    overrides = {
    --      LineNr = { fg = colors.comment },
    --      NonText = { fg = colors.comment },
    --    }
    --  })
    --end,
  }, "Shatur/neovim-ayu" },

  { 'sainnhe/everforest' },
  { "webhooked/kanso.nvim"},
  { "EdenEast/nightfox.nvim" ,
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd([[colorscheme dayfox]])
    end
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", },
  {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,
  },
  { "tiagovla/tokyodark.nvim", },
  { "olimorris/onedarkpro.nvim", },





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
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      -- setup = {
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
      -- },
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
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = false, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true -- Auto close on trailing </
        },
      })
    end
  },
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    'bloznelis/before.nvim',
    config = function()
      local before = require('before')
      before.setup()

      -- Jump to previous entry in the edit history
      vim.keymap.set('n', '[;', before.jump_to_last_edit, {})

      -- Jump to next entry in the edit history
      vim.keymap.set('n', '];', before.jump_to_next_edit, {})

      -- Look for previous edits in quickfix list
      -- vim.keymap.set('n', '<leader>', before.show_edits_in_quickfix, {})

      vim.keymap.set('n', '<leader>;', before.show_edits_in_quickfix, {})
    end
  }

}
