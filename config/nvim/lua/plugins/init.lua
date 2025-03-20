
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
        silent_chdir = true,

      }
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
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      words = { enabled = false },
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
  { "rebelot/kanagawa.nvim",
  },
  { "Shatur/neovim-ayu" },
  { 'sainnhe/everforest' },
  { "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
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

      vim.cmd([[set background=light]])
      vim.cmd([[colorscheme dawnfox]])
    end
  },

  { "scottmckendry/cyberdream.nvim" },
  { "olimorris/onedarkpro.nvim" },
  {
    'b0o/lavi.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
  },

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
            local lspconfig = require("lspconfig")
            lspconfig.glint.setup({
              capabilities = capabilities,
              filetypes= { 'html.handlebars', 'handlebars', 'typescript.glimmer', 'javascript.glimmer' }
            })
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
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
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
          auto_show_delay_ms = 500,
          window = { border = 'rounded' },
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
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
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
  -- {
  --   "hrsh7th/nvim-cmp",
  --   version = false, -- last release is way too old
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     "saadparwaiz1/cmp_luasnip",
  --     "onsails/lspkind.nvim"
  --   },
  --   opts = function()
  --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --     local cmp = require("cmp")
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end

  --     local lspkind = require('lspkind')

  --     local luasnip = require("luasnip")


  --     local cmp_action = require('lsp-zero').cmp_action()
  --     local defaults = require("cmp.config.default")()
  --     return {
  --       preselect = cmp.PreselectMode.None,
  --       completion = {
  --         completeopt = "menu,menuone,noinsert,noselect",
  --       },
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<S-CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<C-CR>"] = function(fallback)
  --           cmp.abort()
  --           fallback()
  --         end,
  --         ["<Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --             cmp.select_next_item()
  --             -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --             -- this way you will only jump inside the snippet region
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           elseif has_words_before() then
  --             cmp.complete()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<S-Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_prev_item()
  --           elseif luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "path" },
  --       }, {
  --         { name = "buffer" },
  --       }),
  --       formatting = {
  --         format = lspkind.cmp_format({
  --           mode = "symbol_text",
  --           menu = ({
  --             --buffer = "[Buffer]",
  --             --nvim_lsp = "[LSP]",
  --             -- luasnip = "[Snip]",
  --             --nvim_lua = "[Lua]",
  --             --latex_symbols = "[Latex]",
  --           })
  --         })
  --       },
  --       experimental = {
  --         ghost_text = false
  --       },
  --       window = {
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --       sorting = defaults.sorting,
  --     }
  --   end,
  --   ---@param opts cmp.ConfigSchema
  --   config = function(_, opts)
  --     for _, source in ipairs(opts.sources) do
  --       source.group_index = source.group_index or 1
  --     end
  --     local cmp = require("cmp")
  --     cmp.setup(opts)
  --     cmp.setup.cmdline(':', {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = cmp.config.sources({
  --         { name = 'path' }
  --       }, {
  --         {
  --           name = 'cmdline',
  --           option = {
  --             ignore_cmds = { 'Man', '!' }
  --           }
  --         }
  --       })
  --     })
  --   end,
  -- },

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

  -- fun
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
}

}
