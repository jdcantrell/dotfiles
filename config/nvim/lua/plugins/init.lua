return {
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  {"rcarriga/nvim-notify"},
  --  { 'stevearc/dressing.nvim', opts = {}, },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     messages = {
  --       view = "mini",
  --       view_search = "mini",
  --     },
  --   	routes = {
  --       {
  --         view = "mini",
  --         filter = {
  --           event = "msg_show",
  --           find = "substitutions",
  --         },
  --       },
  --       { filter = { find = "fewer lines;" }, opts = { skip = true } },
  --       { filter = { find = "more line;" }, opts = { skip = true } },
  --       { filter = { find = "more lines;" }, opts = { skip = true } },
  --       { filter = { find = "less;" }, opts = { skip = true } },
  --       { filter = { find = "change;" }, opts = { skip = true } },
  --       { filter = { find = "changes;" }, opts = { skip = true } },
  --       { filter = { find = "indent" }, opts = { skip = true } },
  --       { filter = { find = "move" }, opts = { skip = true } },
  --     },
  --     cmdline = {
  --       view = "cmdline"
  --     },
  --     popupmenu = {
  --       backend = "cmp"
  --     },
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --       documentation = {
  --         view = "hover",
  --         ---@type NoiceViewOptions
  --         opts = {
  --           lang = "markdown",
  --           replace = true,
  --           render = "plain",
  --           format = { "{message}" },
  --           win_options = { concealcursor = "n", conceallevel = 3 },
  --         },
  --       },
  --       signature = {
  --         auto_open = {
  --           enabled = false
  --         }
  --       },
  --     },
  --     presets = {
  --       bottom_search = true,
  --       command_palette = true,
  --       long_message_to_split = true,
  --       inc_rename = true,
  --       lsp_doc_border = true,
  --     },
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
  --     { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
  --     { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
  --     { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
  --     { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
  --     { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
  --     { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  --   },
  -- },
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
  {"folke/which-key.nvim",
   event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
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
  {'shaunsingh/moonlight.nvim'},
  { "folke/tokyonight.nvim" },
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme bamboo]])
    end,
  },
  { "EdenEast/nightfox.nvim" },
  { "marko-cerovac/material.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin"
  },
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
        lualine_x = {
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          -- color = Util.ui.fg("Statement"),
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          -- color = Util.ui.fg("Constant"),
        },

        },
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


  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function ()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr, preserve_mappings = false })
        -- add <leader>x to apply quickfix
        vim.api.nvim_set_keymap("n", "<leader>x", '<cmd>lua vim.lsp.buf.code_action({apply = true, context = { only = { "quickfix" }}})<CR>', { silent = true })
      end)

    end
  },
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
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
      servers = {
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    config = function()
      -- get all the servers that are available through mason-lspconfig
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },
  { 'L3MON4D3/LuaSnip',
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function ()
      local ls = require('luasnip')
      require("luasnip.loaders.from_vscode").lazy_load()
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})
    end
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim"
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local lspkind = require('lspkind')

      local luasnip = require("luasnip")


      local cmp_action = require('lsp-zero').cmp_action()
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
              --buffer = "[Buffer]",
              --nvim_lsp = "[LSP]",
              -- luasnip = "[Snip]",
              --nvim_lua = "[Lua]",
              --latex_symbols = "[Latex]",
            })
          })
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        window = {
           completion = cmp.config.window.bordered(),
           documentation = cmp.config.window.bordered(),
         },
        sorting = defaults.sorting,
      }
    end,
    ---@param opts cmp.ConfigSchema
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      local cmp = require("cmp")
      cmp.setup(opts)
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
      })
    end,
  },
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
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
        multiline_threshold = 1,
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
  -- { "sheerun/vim-polyglot" },

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
  { "github/copilot.vim" },
}

