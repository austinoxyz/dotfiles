 -- init.lua

require 'austino.nvim_path'
require 'austino.options'
require 'austino.keymaps'
require 'austino.plugins'
require 'austino.colorscheme'
require 'austino.spellcheck'
require 'austino.aliases'
require 'austino.autocmds'
require 'austino.help'

require 'austino.lsp'
require 'austino.lualine'
require 'austino.nvim-tree'
require 'austino.fzf'
require 'austino.coc'
require 'austino.treesitter'
require 'austino.netrw'
--require 'austino.nvim-dap'
require 'austino.vimtex'

require 'austino.functions.c-split'

if vim.g.neovide then
  require 'austino.config.neovide'
end
