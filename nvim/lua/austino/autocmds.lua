 -- lua/austino/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd

autocmd('FileType', {
    pattern = 'qf',
    command = 'wincmd J'
})
