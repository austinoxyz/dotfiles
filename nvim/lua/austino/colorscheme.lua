 -- lua/austino/colorscheme.lua
 
-- Gruvbox colorscheme
-----------------------------
--local colorscheme = "gruvbox"
local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
-----------------------------

-- Native terminal colorscheme
-----------------------------
--local colorscheme_cmd = [[
--if (has("termguicolors"))
-- set termguicolors
--endif
--
--set background=dark " or light, depending on your terminal's background
--
--let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--
--if (exists("$COLORTERM"))
-- let g:terminal_ansi_colors = [
--       \ "black", "red", "green", "yellow",
--       \ "blue", "magenta", "cyan", "white",
--       \ "black", "red", "green", "yellow",
--       \ "blue", "magenta", "cyan", "white"
--       \ ]
--endif
--]]
--vim.api.nvim_exec(colorscheme_cmd, false)
-----------------------------

