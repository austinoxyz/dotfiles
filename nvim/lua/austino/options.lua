 -- lua/austino/options.lua

local nvim_options = {
    tabstop         = 4, 		     -- tabs are 4 spaces
    softtabstop     = 4, 		     -- tabs are 4 spaces
    shiftwidth      = 4, 		     -- tabs are 4 spaces
    number          = true, 	     -- line numbering
    relativenumber	= true,          -- ruler mode line numbering
    wrap		    = false, 	     -- don't wrap lines by default
    hlsearch	    = true, 	     -- highlight searches
--    colorcolumn     = "80",          -- try to enforce 80 column limit
    autoindent      = false,         -- auto indent new lines
    expandtab       = true, 	     -- convert tabs to spaces
    hidden          = false, 	     -- no hidden buffers
    splitbelow      = true, 	     -- default split beneath
    splitright      = true, 	     -- default split to right
    autoread        = true,          -- automatically read on change
    undofile        = true, 	     -- enable persistent undo
    showmode        = false,         -- show current mode
    timeout         = true,          -- keystrokes will expire
    timeoutlen      = 500,           -- ms until keystroke expires
    termguicolors	= true,          -- better colors
    updatetime  	= 300, 		     -- faster updates
    guifont         = "iosevka:h10", -- iosevka best font
    syntax		    = "enable",      -- use syntax highlighting
    encoding	    = "utf-8",       -- file encoding
    fileformat      = "unix",        -- unix file format
    clipboard       = "unnamedplus", -- use '+' for system clipboard register
}

for k, v in pairs(nvim_options) do
    vim.opt[k] = v
end

vim.cmd "let g:python3_host_prog = '/usr/bin/python3'"
vim.cmd "set nohidden"
