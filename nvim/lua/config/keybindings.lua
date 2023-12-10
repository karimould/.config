local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Better window navigation
-- window management
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- Buffer management
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close / Hide / Unload buffer
keymap("n", "<leader>bd", ":bd<CR>:bnext<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Disable arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)

keymap("v", "<Up>", "<Nop>", opts)
keymap("v", "<Down>", "<Nop>", opts)
keymap("v", "<Left>", "<Nop>", opts)
keymap("v", "<Right>", "<Nop>", opts)

-- Search
keymap("n", "<esc>", ":noh <CR>", opts)

-- Center screen
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- UI
keymap("n", "<leader>uR", ":set relativenumber!<CR> :set linenumber!<CR>", { desc = "Toggle relative line numbers" })
keymap("n", "<leader>ee", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

local map = vim.keymap.set

-- Line movement Soft wrap movement fix
map("n", "j", "gj") -- move vert by visual line
map("n", "k", "gk") -- move vert by visual line
-- HL as amplified versions of hjkl
map({ "n", "v" }, "H", "0^") -- "beginning of line"
map({ "n", "v" }, "L", "$") --"end of line" ,
map({ "n", "v" }, "M", "gm") --"middle of line" ,
