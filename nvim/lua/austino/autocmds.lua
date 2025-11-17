 -- lua/austino/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('vim_commentary', { clear = true })
augroup('color_column', { clear = true })

autocmd('FileType', {
  pattern = 'help',
  command = 'wincmd J'
})

autocmd('FileType', {
  pattern = { '*.c', '*.h' },
  command = 'set path+=./include,./src,'
})

-- append to path when in a cpp file/project so `gf` and `gd` commands work
autocmd('BufEnter', {
  pattern = { "*.cpp", "*.hpp", "*.cc", "*.hh", "*.h" },
  callback = function()
    local root = vim.fs.find(
      { "compile_commands.json", "CMakeLists.txt", "Makefile", ".git" },
      { upward = true, type = "file" }
    )[1]

    if not root then return end
    root = vim.fs.dirname(root)

    vim.opt.path:append(root .. "/src")
    vim.opt.path:append(root .. "/include")
  end
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

