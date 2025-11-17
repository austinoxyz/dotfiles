-- lua/austino/keymaps.lua


-- Globals
-----------------------------------------------------------
local opts = { noremap = true, silent = true }
local noremap_only = { noremap = true }

local keymap = vim.api.nvim_set_keymap

-- leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-----------------------------------------------------------

-- General Convenience
-----------------------------------------------------------
-- remap C-c to <esc>
keymap("n", "<c-c>", "<esc>", opts)
keymap("i", "<c-c>", "<esc>", opts)
keymap("v", "<c-c>", "<esc>", opts)
keymap("o", "<c-c>", "<esc>", opts)

-- exit terminal with esc
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- hide highlighting from last search until next search
keymap("n", "<m-/>", ":noh<cr>", opts)

-- toggle line wrapping
keymap("n", "<m-1>", ":set wrap<cr>", opts)
keymap("n", "<m-!>", ":set nowrap<cr>", opts)

-- toggle highlighting of color codes
keymap("n", "<m-2>", ":ColorizerToggle<cr>", opts)
keymap("n", "<m-@>", ":ColorizerReloadAllBuffers<cr>", opts)

-- spellchecking
keymap("n", "<m-=>", ":set spell!<cr>", opts)

-- yank the current visual selection into the system clipboard
keymap("v", "<c-c>", ":'<,'>w !xclip -i -sel c<cr><cr>", opts)

-- hide highlighting from last search until next search
keymap("n", "<m-/>", ":noh<cr>", opts)
-----------------------------------------------------------

-- Window/Tab/Buffer/Cursor Management/Navigation
-----------------------------------------------------------
-- open and close tabs
keymap("n", "<m-i>", ":tabnew ", noremap_only)
keymap("n", "<m-y>", ":tabclose<cr>", opts)

-- close buffer
keymap("n", "<m-7>", ":bd<cr>", opts)

-- navigate tabs
keymap("n", "<m-p>", ":+tabn<cr>", opts)
keymap("n", "<m-o>", ":-tabn<cr>", opts)

-- navigate buffers
keymap("n", "<m-->", ":-b<cr>", opts)
keymap("n", "<m-=>", ":+b<cr>", opts)

-- move tabs and switch to them
keymap("n", "<m-p>", ":+tabn<cr>", opts)
keymap("n", "<m-o>", ":-tabn<cr>", opts)
keymap("n", "<m-P>", ":tabm +1<cr>", opts)
keymap("n", "<m-O>", ":tabm -1<cr>", opts)

-- resize splits easier
keymap("n", "<leader>.", "5<c-w>>", opts)
keymap("n", "<leader>,", "5<c-w><", opts)
keymap("n", "<leader>=", "5<c-w>+", opts)
keymap("n", "<leader>-", "5<c-w>-", opts)

-- swap (v|h)split around with Alt+S
keymap("n", "<m-S>", "<c-w>r", opts)

-- move cursor between windows alt Alt+[vimkey]
keymap("n", "<m-h>", "<c-w>h", opts)
keymap("n", "<m-l>", "<c-w>l", opts)
keymap("n", "<m-k>", "<c-w>k", opts)
keymap("n", "<m-j>", "<c-w>j", opts)

-- move cursor between windows with arrow keys
keymap("n", "<Left>",  "<c-w>h", opts)
keymap("n", "<Right>", "<c-w>l", opts)
keymap("n", "<Up>",    "<c-w>k", opts)
keymap("n", "<Down>",  "<c-w>j", opts)
-----------------------------------------------------------

-- diagnostics
-----------------------------------------------------------
keymap("n", "L", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-----------------------------------------------------------

-- Navigation
-----------------------------------------------------------
keymap("n", "<leader>f", ":Pick files tool='git'<CR>", opts)
keymap("n", "<leader>r", ":Pick grep_live tool='git'<CR>", opts)

-- navigate ctags
keymap("n", "<m-]>", "<c-]>", opts)
keymap("n", "<m-[>", "<c-t>", opts)
-----------------------------------------------------------

-- Project Management/Navigation
-----------------------------------------------------------
-- For C/C++ projects, open a header/source file in a tabnew vsplit, 
-- or just one in a tabnew if only one exists. 
--
-- The function assumes that headers are located in `./include/` 
-- and sources are located in `./src/`.
--
-- Will match on any of ("h","hpp","hh") and ("c","cpp","cc") as 
-- file extensions for the argument passed.
--
-- Usage - :OpenCSplit filename-base
--       - :OpenCSplit path/to/filename-base
keymap("n", "<m-;>", ":OpenCSplit ", noremap_only)

-- make clean all
keymap("n", "<m-\\>", ":make clean all<cr>", noremap_only)
-----------------------------------------------------------
