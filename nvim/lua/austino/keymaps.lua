 -- lua/austino/keymaps.lua

-- Modes
  -- normal_mode = "n",
  -- insert_mode = "i",
  -- visual_mode = "v",
  -- visual_block_mode = "x",
  -- term_mode = "t",
  -- command_mode = "c",

local opts = { noremap = true, silent = true }
local coc_opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local noremap_only = { noremap = true }

local keymap = vim.api.nvim_set_keymap
local keyset = vim.keymap.set

-- leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

 -- remap C-c to <esc>
keymap("n", "<c-c>", "<esc>", opts)
keymap("i", "<c-c>", "<esc>", opts)
keymap("v", "<c-c>", "<esc>", opts)
keymap("o", "<c-c>", "<esc>", opts)

 -- navigate and move tabs
keymap("n", "<m-p>", ":+tabn<cr>", opts)
keymap("n", "<m-o>", ":-tabn<cr>", opts)
keymap("n", "<m-P>", ":tabm +1<cr>", opts)
keymap("n", "<m-O>", ":tabm -1<cr>", opts)

 -- remap C-c to <esc>
keymap("n", "<c-c>", "<esc>", opts)
keymap("i", "<c-c>", "<esc>", opts)
keymap("v", "<c-c>", "<esc>", opts)
keymap("o", "<c-c>", "<esc>", opts)

 -- navigate tabs
keymap("n", "<m-p>", ":+tabn<cr>", opts)
keymap("n", "<m-o>", ":-tabn<cr>", opts)

 -- navigate buffers
keymap("n", "<m-->", ":-b<cr>", opts)
keymap("n", "<m-=>", ":+b<cr>", opts)

 -- navigate ctags
--keymap("n", "<m-]>", "<c-]>", opts)
--keymap("n", "<m-[>", "<c-t>", opts)

 -- generate ctags file for cpp or c projects
keymap("n", "<m-3>", ":!ctags -R --exclude=.ccls-cache .<cr>", opts)

 -- open header and src in vertically split new tab
keymap("n", "<m-;>", ":OpenCPPTab ", noremap_only)

-- make clean all
keymap("n", "<m-\\>", ":make clean all<cr>", noremap_only)

 -- open and close tabs
keymap("n", "<m-i>", ":tabnew ", noremap_only)
keymap("n", "<m-y>", ":tabclose<cr>", opts)

 -- toggle line wrapping
keymap("n", "<m-1>", ":set wrap<cr>", opts)
keymap("n", "<m-!>", ":set nowrap<cr>", opts)

 -- toggle highlighting of color codes
keymap("n", "<m-2>", ":ColorizerToggle<cr>", opts)
keymap("n", "<m-@>", ":ColorizerReloadAllBuffers<cr>", opts)

 -- close buffer
keymap("n", "<m-7>", ":bd<cr>", opts)

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
 -- edit current README.md, vertically or horizontally if desired
keymap("n", "<leader>3e", ":e   README.md<cr>", opts)
keymap("n", "<leader>3v", ":vsp README.md<cr>", opts)
keymap("n", "<leader>3h", ":sp  README.md<cr>", opts)


-- hide highlighting from last search until next search
keymap("n", "<m-/>", ":noh<cr>", opts)

 -- "applications"
keymap("n", "<leader>h", ":FZF<cr>", opts)
keymap("n", "<leader>f", ":Files<cr>", opts)
keymap("n", "<leader>t", ":Tags<cr>", opts)
keymap("n", "<leader>r", ":Rg<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeOpen<cr>", opts)

 -- vimspector keymappings
--keymap("n", "<m-p>", ":call vimspector#Pause()<cr>", opts)
keymap("n", "<m-q>", ":call vimspector#Reset()<cr>", opts)
keymap("n", "<m-w>", ":call vimspector#Launch()<cr>", opts)
keymap("n", "<m-e>", ":call vimspector#Stop()<cr>", opts)
keymap("n", "<m-c>", ":call vimspector#Continue()<cr>", opts)
keymap("n", "<m-x>", ":call vimspector#ToggleBreakpoint()<cr>", opts)
keymap("n", "<m-v>", ":call vimspector#ToggleConditionalBreakpoint()<cr>", opts)
keymap("n", "<m-z>", ":call vimspector#ClearBreakpoints()<cr>", opts)
keymap("n", "<m-a>", ":call vimspector#StepOver()<cr>", opts)
keymap("n", "<m-s>", ":call vimspector#StepInto()<cr>", opts)
keymap("n", "<m-d>", ":call vimspector#StepOut()<cr>", opts)
keymap("n", "<m-r>", ":call vimspector#UpFrame()<cr>", opts)
keymap("n", "<m-f>", ":call vimspector#DownFrame()<cr>", opts)

 -- spellchecking
keymap("n", "<m-=>", ":set spell!<cr>", opts)

 ---- coc keymaps
local keyset = vim.keymap.set
local coc_opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

 -- completion with Tab and Shift+Tab
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', coc_opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], coc_opts)


keymap("n", "<m-->", ":-b<cr>", opts)
keymap("n", "<m-=>", ":+b<cr>", opts)

 -- navigate ctags
keymap("n", "<m-]>", "<c-]>", opts)
keymap("n", "<m-[>", "<c-t>", opts)

 -- generate ctags file for cpp or c projects
keymap("n", "<m-3>", ":!ctags -R --exclude=.ccls-cache .<cr>", opts)

 -- open header and src in vertically split new tab
keymap("n", "<m-;>", ":OpenCPPTab ", noremap_only)

-- make clean all
keymap("n", "<m-\\>", ":make clean all<cr>", noremap_only)

 -- open and close tabs
keymap("n", "<m-i>", ":tabnew ", noremap_only)
keymap("n", "<m-y>", ":tabclose<cr>", opts)

 -- toggle line wrapping
keymap("n", "<m-1>", ":set wrap<cr>", opts)
keymap("n", "<m-!>", ":set nowrap<cr>", opts)

 -- toggle highlighting of color codes
keymap("n", "<m-2>", ":ColorizerToggle<cr>", opts)
keymap("n", "<m-@>", ":ColorizerReloadAllBuffers<cr>", opts)

 -- close buffer
keymap("n", "<m-7>", ":bd<cr>", opts)

 -- move cursor between windows alt Alt+[vimkey]
keymap("n", "<m-h>", "<c-w>h", opts)
keymap("n", "<m-l>", "<c-w>l", opts)
keymap("n", "<m-k>", "<c-w>k", opts)
keymap("n", "<m-j>", "<c-w>j", opts)

 -- swap (v|h)split around with Alt+S
keymap("n", "<m-S>", "<c-w>r", opts)

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
 -- edit current README.md, vertically or horizontally if desired
keymap("n", "<leader>3e", ":e   README.md<cr>", opts)
keymap("n", "<leader>3v", ":vsp README.md<cr>", opts)
keymap("n", "<leader>3h", ":sp  README.md<cr>", opts)

 -- yank the current visual selection into the system clipboard
keymap("v", "<c-c>", ":'<,'>w !xclip -i -sel c<cr><cr>", opts)

-- hide highlighting from last search until next search
keymap("n", "<m-/>", ":noh<cr>", opts)

 -- "applications"
keymap("n", "<leader>h", ":FZF<cr>", opts)
keymap("n", "<leader>f", ":Files<cr>", opts)
keymap("n", "<leader>t", ":Tags<cr>", opts)
keymap("n", "<leader>r", ":Rg<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeOpen<cr>", opts)

 -- vimspector keymappings
--keymap("n", "<m-p>", ":call vimspector#Pause()<cr>", opts)
keymap("n", "<m-q>", ":call vimspector#Reset()<cr>", opts)
keymap("n", "<m-w>", ":call vimspector#Launch()<cr>", opts)
keymap("n", "<m-e>", ":call vimspector#Stop()<cr>", opts)
keymap("n", "<m-c>", ":call vimspector#Continue()<cr>", opts)
keymap("n", "<m-x>", ":call vimspector#ToggleBreakpoint()<cr>", opts)
keymap("n", "<m-v>", ":call vimspector#ToggleConditionalBreakpoint()<cr>", opts)
keymap("n", "<m-z>", ":call vimspector#ClearBreakpoints()<cr>", opts)
keymap("n", "<m-a>", ":call vimspector#StepOver()<cr>", opts)
keymap("n", "<m-s>", ":call vimspector#StepInto()<cr>", opts)
keymap("n", "<m-d>", ":call vimspector#StepOut()<cr>", opts)
keymap("n", "<m-r>", ":call vimspector#UpFrame()<cr>", opts)
keymap("n", "<m-f>", ":call vimspector#DownFrame()<cr>", opts)

 -- spellchecking
keymap("n", "<m-=>", ":set spell!<cr>", opts)

 -- completion with Tab and Shift+Tab
keyset("i", "<tab>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', coc_opts)
keyset("i", "<s-tab>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], coc_opts)

