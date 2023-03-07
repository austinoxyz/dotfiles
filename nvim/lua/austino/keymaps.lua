 -- lua/austino/keymaps.lua

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

 -- shorten function name
local keymap = vim.api.nvim_set_keymap

-- leader key
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


 -- toggle line wrapping
keymap("n", "<m-1>", ":set wrap<cr>", opts)
keymap("n", "<m-!>", ":set nowrap<cr>", opts)


 -- remap C-c to <esc>
keymap("n", "<c-c>", "<esc>", opts)
keymap("i", "<c-c>", "<esc>", opts)
keymap("v", "<c-c>", "<esc>", opts)
keymap("o", "<c-c>", "<esc>", opts)

 -- navigate tabs
keymap("n", "<m-p>", ":+tabn<cr>", opts)
keymap("n", "<m-o>", ":-tabn<cr>", opts)

 -- navigate buffers
keymap("n", "<m-9>", ":-b<cr>", opts)
keymap("n", "<m-0>", ":+b<cr>", opts)

 -- navigate ctags
keymap("n", "<m-]>", "<c-]>", opts)
keymap("n", "<m-[>", "<c-t>", opts)

 -- open and close tabs
keymap("n", "<m-i>", ":tabnew ", opts)
keymap("n", "<m-y>", ":tabclose<cr>", opts)

 -- close buffer
keymap("n", "<m-7>", ":bd<cr>", opts)

 -- move curosr between windows alt Alt+[vimkey]
keymap("n", "<m-h>", "<c-w>h", opts)
keymap("n", "<m-l>", "<c-w>l", opts)
keymap("n", "<m-k>", "<c-w>k", opts)
keymap("n", "<m-j>", "<c-w>j", opts)

 -- move cursor between windows with arrow keys
keymap("n", "<Left>",  "<c-w>h", opts)
keymap("n", "<Right>", "<c-w>l", opts)
keymap("n", "<Up>",    "<c-w>k", opts)
keymap("n", "<Down>",  "<c-w>j", opts)

 -- resize splits easier
keymap("n", "<leader>.", "5<c-w>>", opts)
keymap("n", "<leader>,", "5<c-w><", opts)
keymap("n", "<leader>=", "5<c-w>+", opts)
keymap("n", "<leader>-", "5<c-w>-", opts)

 -- exit terminal with esc
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

 -- edit vimrc, vertically or horizontally if desired
keymap("n", "<leader>`e", ":e   $MYVIMRC<cr>", opts)
keymap("n", "<leader>`v", ":vsp $MYVIMRC<cr>", opts)
keymap("n", "<leader>`h", ":sp  $MYVIMRC<cr>", opts)
 -- edit current .vimspector.json, vertically or horizontally if desired
keymap("n", "<leader>1e", ":e   ./.vimspector.json<cr>", opts)
keymap("n", "<leader>1v", ":vsp ./.vimspector.json<cr>", opts)
keymap("n", "<leader>1h", ":sp  ./.vimspector.json<cr>", opts)
 -- edit current Makefile, vertically or horizontally if desired
keymap("n", "<leader>2e", ":e   Makefile<cr>", opts)
keymap("n", "<leader>2v", ":vsp Makefile<cr>", opts)
keymap("n", "<leader>2h", ":sp  Makefile<cr>", opts)

 -- generate ctags file for cpp projects
keymap("n", "<leader>=", ":!ctags src/*.cpp include/*.hpp main.cpp<cr>", opts)

 -- "applications"
keymap("n", "<leader>h", ":FZF<cr>", opts)
keymap("n", "<leader>f", ":Files<cr>", opts)
keymap("n", "<leader>t", ":Tags<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeOpen<cr>", opts)

 -- vimspector keymappings
keymap("n", "<leader>da", ":call vimspector#Launch()<cr>", opts)
keymap("n", "<leader>dp", ":call vimspector#Pause()<cr>", opts)
keymap("n", "<leader>dq", ":call vimspector#Stop()<cr>", opts)
keymap("n", "<leader>dx", ":call vimspector#Reset()<cr>", opts)
keymap("n", "<leader>dc", ":call vimspector#Continue()<cr>", opts)
keymap("n", "<leader>dh", ":call vimspector#ToggleBreakpoint()<cr>", opts)
keymap("n", "<leader>de", ":call vimspector#ToggleConditionalBreakpoint()<cr>", opts)
keymap("n", "<leader>dz", ":call vimspector#ClearBreakpoints()<cr>", opts)
keymap("n", "<s-y>", ":call vimspector#DownFrame()<cr>", opts)
keymap("n", "<s-u>", ":call vimspector#UpFrame()<cr>", opts)
keymap("n", "<s-j>", ":call vimspector#StepOver()<cr>", opts)
keymap("n", "<s-k>", ":call vimspector#StepOut()<cr>", opts)
keymap("n", "<s-l>", ":call vimspector#StepInto()<cr>", opts)

 -- spellchecking
keymap("n", "<m-\\>", ":set spell!<cr>", opts)

 -- toggle highlighting of color codes
keymap("n", "<m-2>", ":ColorizerToggle<cr>", opts)
keymap("n", "<m-@>", ":ColorizerReloadAllBuffers<cr>", opts)
