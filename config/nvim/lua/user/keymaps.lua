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

vim.keymap.set("n", "zg", "<cmd>lua Snacks.gitbrowse({ branch = 'main' })<CR>", {noremap=true})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set({"n"}, "<leader>xx", function()
      vim.lsp.buf.code_action({apply = true, context = { only = { "quickfix" }}})
    end, { noremap = true, silent = true })
    vim.keymap.set({ "n", "x" }, "<leader>xc", function()
      require("tiny-code-action").code_action()
    end, { noremap = true, silent = true })
  end,
})
