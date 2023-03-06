  -- lua/user/options.lua
  --

local set_global = vim.api.nvim_set_var

-- local options = {
--set_global("airline_theme", "cool")
set_global("airline_powerline_fonts", "1")

 -- status bar
set_global("airline_left_sep",         "")
set_global("airline_left_alt_sep",     "")
set_global("airline_right_sep",        "")
set_global("airline_right_alt_sep",    "")
set_global("airline_symbols.branch",   "")
set_global("airline_symbols.readonly", "")
set_global("airline_symbols.linenr",   "")

 -- tabline
set_global("airline#extensions#tabline#enabled",       "1")
set_global("airline#extensions#tabline#formatter",     "unique_tail")
set_global("airline#extensions#tabline#left_sep",      "")
set_global("airline#extensions#tabline#left_alt_sep",  "")
set_global("airline#extensions#tabline#right_sep",     "")
set_global("airline#extensions#tabline#right_alt_sep", "")

