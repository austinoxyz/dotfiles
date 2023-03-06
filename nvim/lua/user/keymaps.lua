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
keymap("n", "<M-=>", ":set wrap<CR>", opts)
keymap("n", "<M-+>", ":set nowrap<CR>", opts)

 -- remap C-c to <esc>
keymap("n", "<c-c>", "<esc>", opts)
keymap("i", "<c-c>", "<esc>", opts)
keymap("v", "<c-c>", "<esc>", opts)
keymap("o", "<c-c>", "<esc>", opts)

 -- navigate tabs
keymap("n", "<M-p>", ":+tabn<CR>", opts)
keymap("n", "<M-o>", ":-tabn<CR>", opts)

 -- navigate buffers
keymap("n", "<M-0>", ":+b<CR>", opts)
keymap("n", "<M-9>", ":-b<CR>", opts)

 -- navigate ctags
keymap("n", "<M-]>", "<c-]>", opts)
keymap("n", "<M-[>", "<c-t>", opts)

 -- open and close tabs
keymap("n", "<M-i>", ":tabnew ", opts)
keymap("n", "<M-y>", ":tabclose<CR>", opts)

 -- move curosr between windows alt Alt+[vimkey]
keymap("n", "<M-h>", "<c-w>h", opts)
keymap("n", "<M-l>", "<c-w>l", opts)
keymap("n", "<M-k>", "<c-w>k", opts)
keymap("n", "<M-j>", "<c-w>j", opts)

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
keymap("n", "<leader>`e", ":e   $MYVIMRC<CR>", opts)
keymap("n", "<leader>`v", ":vsp $MYVIMRC<CR>", opts)
keymap("n", "<leader>`h", ":sp  $MYVIMRC<CR>", opts)
 -- edit current .vimspector.json, vertically or horizontally if desired
keymap("n", "<leader>1e", ":e   ./.vimspector.json<CR>", opts)
keymap("n", "<leader>1v", ":vsp ./.vimspector.json<CR>", opts)
keymap("n", "<leader>1h", ":sp  ./.vimspector.json<CR>", opts)
 -- edit current Makefile, vertically or horizontally if desired
keymap("n", "<leader>2e", ":e   Makefile<CR>", opts)
keymap("n", "<leader>2v", ":vsp Makefile<CR>", opts)
keymap("n", "<leader>2h", ":sp  Makefile<CR>", opts)

 -- generate ctags file for cpp projects
keymap("n", "<leader>=", ":!ctags src/*.cpp include/*.hpp main.cpp<CR>", opts)

 -- junegunn/fzf 
keymap("n", "<leader>h", ":FZF<CR>", opts)
keymap("n", "<leader>f", ":Files<CR>", opts)
keymap("n", "<leader>t", ":Tags<CR>", opts)

 -- vimspector keymappings
keymap("n", "<leader>da", ":call vimspector#Launch()<CR>", opts)
keymap("n", "<leader>dp", ":call vimspector#Pause()<CR>", opts)
keymap("n", "<leader>dq", ":call vimspector#Stop()<CR>", opts)
keymap("n", "<leader>dx", ":call vimspector#Reset()<CR>", opts)
keymap("n", "<leader>dc", ":call vimspector#Continue()<CR>", opts)
keymap("n", "<leader>dh", ":call vimspector#ToggleBreakpoint()<CR>", opts)
keymap("n", "<leader>de", ":call vimspector#ToggleConditionalBreakpoint()<CR>", opts)
keymap("n", "<leader>dz", ":call vimspector#ClearBreakpoints()<CR>", opts)
keymap("n", "<S-y>", ":call vimspector#DownFrame()<CR>", opts)
keymap("n", "<S-u>", ":call vimspector#UpFrame()<CR>", opts)
keymap("n", "<S-j>", ":call vimspector#StepOver()<CR>", opts)
keymap("n", "<S-k>", ":call vimspector#StepOut()<CR>", opts)
keymap("n", "<S-l>", ":call vimspector#StepInto()<CR>", opts)

