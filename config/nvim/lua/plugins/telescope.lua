
local M = {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = {
		{'nvim-lua/plenary.nvim'}
	},
	cmd = { "Telescope", "Tel" }, -- lazy loads on these commands
	-- keys = { "<leader>f" }, -- lazy loads on this pattern
}

function M.config()


	local status_ok, telescope = pcall(require, "telescope")
	if not status_ok then
		return
	end

	local pickers = require "telescope.pickers"
	local finders = require "telescope.finders"
	local conf = require("telescope.config").values


	local actions = require "telescope.actions"
	local action_state = require "telescope.actions.state"

	telescope.setup {
		defaults = {

			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "truncate" },
			layout_strategy = 'flex',
			file_ignore_patterns = ignore_these,
			sorting_strategy = "ascending",
			results_title = false,
			layout_config = {
				prompt_position = 'top',
				horizontal = {
					mirror = true,
					preview_cutoff = 100,
					preview_width = 0.5,
				},
				vertical = {
					mirror = true,
					preview_cutoff = 0.4,
				},
				flex = {
					flip_columns = 110,
				},
				height = 0.94,
				width = 0.86,
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,

					["<C-c>"] = actions.close,

					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,

					["<CR>"] = actions.select_default,
					["<C-x>"] = actions.select_horizontal,
				 ["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,

					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,

					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-l>"] = actions.complete_tag,
					["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					["<esc>"] = actions.close,
				},

				n = {
					["<esc>"] = actions.close,
					["<CR>"] = actions.select_default,
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["H"] = actions.move_to_top,
					["M"] = actions.move_to_middle,
					["L"] = actions.move_to_bottom,

					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["gg"] = actions.move_to_top,
					["G"] = actions.move_to_bottom,

					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,

					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,

					["?"] = actions.which_key,
				},
			},
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
		},
	}
	

function find_dir_in_work(opts)

	local code_dir = "/Users/john.cantrellopendoor.com/Work/code/"
	local dir = code_dir
	local depth = "3"
	if opts.path ~= nil then
		dir = code_dir .. opts.path
		depth = "1"
	end

	pickers.new(opts, {
		prompt_title = "Find /code Directory",
		finder = finders.new_oneshot_job({ "fd", "-d", depth, "-t", "d" }, { cwd = dir }),
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
					if selection ~= nil then

						local opts = {
							preview = {
							hide_on_startup = true
							}
						}

						opts.prompt_prefix = "fd " .. selection[1] .. ">"
						opts.cwd = dir .. selection[1] 
						require"telescope.builtin".fd(opts)

					end
			end)
			return true
		end,
	}):find()
end

  vim.api.nvim_create_user_command(
     'EPackages',
     function(input) 
			find_dir_in_work({path = 'js/packages/'})
     end, {}
   )

	 
	end

return M
