 -- init.lua

require 'austino.options'
require 'austino.keymaps'
require 'austino.plugins'
require 'austino.colorscheme'
require 'austino.autocmds'
require 'austino.lsp'
require 'austino.lualine'
require 'austino.treesitter'

require 'austino.functions.c-split'

if vim.g.neovide then
  require 'austino.config.neovide'
end
