 -- init.lua

require "austino.options"
require "austino.keymaps"
require "austino.plugins"
require "austino.colorscheme"
require "austino.spellcheck"
require "austino.aliases"
require "austino.autocmds"

require "austino.config.lualine"
require "austino.config.nvim-tree"
require "austino.config.fzf"
require "austino.config.coc"
require "austino.config.treesitter"
require "austino.config.netrw"

require "austino.functions.c-split"

if vim.g.neovide then
    require "austino.config.neovide"
end
