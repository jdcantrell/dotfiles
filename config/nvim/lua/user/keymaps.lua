local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize+2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Left>", ":bprevious<CR>", opts)
keymap("n", "<Right>", ":bnext<CR>", opts)
keymap("n", "<Space>", "<C-d>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)



-- file list toggle
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>sv", ":luafile $MYVIMRC<CR>", opts)


-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'user.finders'.fd()<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua require'user.finders'.grep({additional_args = {'-S'}})<cr>", opts)
keymap("n", "<leader>d", "<cmd>lua require'user.finders'.grep_string()<cr>", opts)

keymap("n", "<leader>r", "<cmd>lua require'user.finders'.fd_in_code()<cr>", opts)
keymap("n", "<leader>t", "<cmd>lua require'user.finders'.grep_in_code()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require'user.finders'.bfd()<cr>", opts)
keymap("n", "<leader>c", "<cmd>bd<CR>", opts)
 keymap("n", "<leader>C", "<cmd>%bd|e#<CR>", opts)
-- keymap("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts)

keymap("n", "<leader>v", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap('t', '<esc>', [[<C-\><C-n>]], opts)

-- expansions
vim.cmd("cabbr <expr> %% expand('%:p:h')")
vim.cmd("command! W w")

--diagnostics
keymap("n", "<leader>h", ":TroubleToggle document_diagnostics<CR>", opts)
keymap("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next({buffer = 0})<CR>", opts)
keymap(
  "n",
  "gl",
  '<cmd>lua vim.diagnostic.open_float()<CR>',
  opts
)

-- quickfix - open file and close with `o`
vim.api.nvim_create_autocmd(
  "FileType", 
  {
    pattern={"qf"},
    command=[[nnoremap <buffer> o <CR>:cclose<CR>]]
  }
)
