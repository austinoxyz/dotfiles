-- austino/config/neovide.lua
vim.api.nvim_create_autocmd('VimEnter', { pattern={'*'}, command='cd ~/code' })

-- window style
local function alpha()
    return string.format("%x", math.floor(255*vim.g.transparency or 0.8))
end
vim.g.neovide_transparency = 0.9
vim.g.transparency = 0.9
vim.g.neovide_background_color = "#282a36"..alpha()
vim.g.neovide_window_blurred = true

--local function starts_with(str, prefix)
--   return prefix == str:start(1, #prefix)
--end
--osname = vim.loop.os_uname().sysname
--if osname == "Linux" then
--    vim.api.nvim_create_autocmd('VimEnter', { pattern={'*'}, command='cd /home/austin/code' })
--elseif string.starts_with(osname, "Windows") then
--    vim.api.nvim_create_autocmd('VimEnter', { pattern={'*'}, command='cd ~' })
--end
