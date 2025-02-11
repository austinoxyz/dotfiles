 -- lua/austino/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('vim_commentary', { clear = true })
augroup('color_column', { clear = true })

autocmd('FileType', {
    pattern = { '*.cpp', '*.hpp' },
    command = 'setlocal colorcolumn=80 | SetTab 4 | ' 
})

autocmd('FileType', {
    pattern = 'help',
    command = 'wincmd L'
})

autocmd('FileType', {
    pattern = 'help',
    command = 'wincmd L'
})

vim.filetype.add({
    pattern = { ["/home/austin/.config/hypr/*.conf"] = "hyprlang" }
})

--autocmd('FileType', {
--    pattern = '*.qf',
--    command = 'wincmd J'})

