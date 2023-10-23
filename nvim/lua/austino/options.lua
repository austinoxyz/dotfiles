 -- lua/austino/options.lua

local options = {
    syntax		    = "enable",
    encoding	    = "utf-8",
    fileformat      = "unix",
    hlsearch	    = true, 	    -- highlight searches
    number          = true, 	    -- line numbering
    relativenumber	= true,
    wrap		    = false, 	    -- don't wrap lines by default
    termguicolors	= true,
    guifont         = "iosevka:h10",
    updatetime  	= 300, 		    -- faster updates
    hidden          = false, 	    -- no hidden buffers
    autoread        = true,         -- automatically read on change
    tabstop         = 4, 		    -- tabs are 4 spaces
    softtabstop     = 4, 		    -- tabs are 4 spaces
    shiftwidth      = 4, 		    -- tabs are 4 spaces
    expandtab       = true, 	    -- convert tabs to spaces
    autoindent      = true,
    splitbelow      = true, 	    -- default split beneath
    splitright      = true, 	    -- default split to right
    undofile        = true, 	    -- enable persistent undo
    showmode        = false,
    timeout         = true,
    timeoutlen      = 500,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "let g:python3_host_prog = '/usr/bin/python3'"
vim.cmd "set nohidden"
