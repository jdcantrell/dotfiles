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
        enabled = true,
        layout = {
            layout = {
              backdrop = false,
              width = 0.9,
              min_width = 80,
              height = 0.8,
              min_height = 30,
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", height = 0.1, min_height=12, border = "none" },
              { win = "preview", title = "{preview}", height = 0.6, border = "top" },
            },
          },
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
              ["<C-c>"] = "cancel",
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            }
          },
        },
        formatters = {
          file = {
            filename_first = false, -- display filename before the file path
            truncate = 80, -- truncate the file path to (roughly) this length
            filename_only = false, -- only show the filename
            icon_width = 2, -- width of the icon (in characters)
            git_status_hl = true, -- use the git status highlight group for the filename
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

  { "scottmckendry/cyberdream.nvim" },
  { "webhooked/kanso.nvim"},
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
  { "mason-org/mason.nvim", opts = {} },

  -- lsp
  {
    "neovim/nvim-lspconfig",
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
  opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = false,
      },
      capabilities = {}, -- This is fine, we add blink's caps inside `config`
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- This `servers` table is not actually used by this config function,
      -- but it's harmless to leave it.
      servers = {},
    },
  },

  -- okay
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
  },

  --ai things?
  {
  "azorng/goose.nvim",
  config = function()
    require("goose").setup({
      prefered_picker = 'snacks',                     -- 'telescope', 'fzf', 'mini.pick', 'snacks', if nil, it will use the best available picker
      default_global_keymaps = true,             -- If false, disables all default global keymaps
      keymap = {
        global = {
          toggle = '<leader>ag',                 -- Open goose. Close if opened
          open_input = '<leader>ai',             -- Opens and focuses on input window on insert mode
          open_input_new_session = '<leader>aI', -- Opens and focuses on input window on insert mode. Creates a new session
          open_output = '<leader>ao',            -- Opens and focuses on output window
          toggle_focus = '<leader>at',           -- Toggle focus between goose and last window
          close = '<leader>aq',                  -- Close UI windows
          toggle_fullscreen = '<leader>af',      -- Toggle between normal and fullscreen mode
          select_session = '<leader>as',         -- Select and load a goose session
          goose_mode_chat = '<leader>amc',       -- Set goose mode to `chat`. (Tool calling disabled. No editor context besides selections)
          goose_mode_auto = '<leader>ama',       -- Set goose mode to `auto`. (Default mode with full agent capabilities)
          configure_provider = '<leader>ap',     -- Quick provider and model switch from predefined list
          diff_open = '<leader>ad',              -- Opens a diff tab of a modified file since the last goose prompt
          diff_next = '<leader>a]',              -- Navigate to next file diff
          diff_prev = '<leader>a[',              -- Navigate to previous file diff
          diff_close = '<leader>ac',             -- Close diff view tab and return to normal editing
          diff_revert_all = '<leader>ara',       -- Revert all file changes since the last goose prompt
          diff_revert_this = '<leader>art',      -- Revert current file changes since the last goose prompt
        },
        window = {
          submit = '<cr>',                     -- Submit prompt
          close = '<esc>',                     -- Close UI windows
          stop = '<C-c>',                      -- Stop goose while it is running
          next_message = ']]',                 -- Navigate to next message in the conversation
          prev_message = '[[',                 -- Navigate to previous message in the conversation
          mention_file = '@',                  -- Pick a file and add to context. See File Mentions section
          toggle_pane = '<tab>',               -- Toggle between input and output panes
          prev_prompt_history = '<up>',        -- Navigate to previous prompt in history
          next_prompt_history = '<down>'       -- Navigate to next prompt in history
        }
      },
      ui = {
        window_width = 0.35,                   -- Width as percentage of editor width
        input_height = 0.15,                   -- Input height as percentage of window height
        fullscreen = false,                    -- Start in fullscreen mode (default: false)
        layout = "right",                      -- Options: "center" or "right"
        floating_height = 0.8,                 -- Height as percentage of editor height for "center" layout
        display_model = true,                  -- Display model name on top winbar
        display_goose_mode = true              -- Display mode on top winbar: auto|chat
      },
      providers = {
        --[[
        Define available providers and their models for quick model switching
        anthropic|azure|bedrock|databricks|google|groq|ollama|openai|openrouter
        Example:
        openrouter = {
          "anthropic/claude-3.5-sonnet",
          "openai/gpt-4.1",
        },
        ollama = {
          "cogito:14b"
          }
          --]]
      }
    })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
        },
      }
    },
  },

  -- fun
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  }
}
