 -- lua/austino/options.lua

local options = {
    hlsearch	    = true, 	     -- highlight searches
    number          = true, 	     -- line numbering
    relativenumber	= true,          -- ruler mode line numbering
    wrap		    = false, 	     -- don't wrap lines by default
    termguicolors	= true,          -- better colors
    updatetime  	= 300, 		     -- faster updates
    hidden          = false, 	     -- no hidden buffers
    autoread        = true,          -- automatically read on change
    tabstop         = 4, 		     -- tabs are 4 spaces
    softtabstop     = 4, 		     -- tabs are 4 spaces
    shiftwidth      = 4, 		     -- tabs are 4 spaces
    expandtab       = true, 	     -- convert tabs to spaces
    autoindent      = true,          -- auto indent new lines
    splitbelow      = true, 	     -- default split beneath
    splitright      = true, 	     -- default split to right
    undofile        = true, 	     -- enable persistent undo
    showmode        = false,         -- show current mode
    timeout         = true,          -- keystrokes will expire
    timeoutlen      = 500,           -- ms until keystroke expires
    guifont         = "iosevka:h10", -- iosevka best font
    syntax		    = "enable",      -- use syntax highlighting
    encoding	    = "utf-8",       -- file encoding
    fileformat      = "unix",        -- unix file format
    clipboard       = "unnamedplus", -- use '+' for system clipboard register
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "let g:python3_host_prog = '/usr/bin/python3'"
vim.cmd "set nohidden"
