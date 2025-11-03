 -- lua/austino/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('vim_commentary', { clear = true })
augroup('color_column', { clear = true })

autocmd('FileType', {
  pattern = { 'cpp', 'hpp' },
  command = 'setlocal colorcolumn=80 | SetTab 4 | '
})

autocmd('FileType', {
  pattern = 'help',
  command = 'wincmd J'
})

autocmd('FileType', {
  pattern = { '*.c', '*.h' },
  command = 'set path+=./include,./src,'
})

autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.formatoptions:remove({ "o", "c", "r" })
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
    -- for some reason treesitter wants to add a single
    -- space to the beginning of every new line :^)
    vim.cmd("TSDisable indent")
  end,
})

autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.filetype.add({
  pattern = { ["/home/austin/.config/hypr/*.conf"] = "hyprlang" }
})

