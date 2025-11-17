-- lua/austino/plugins.lua

local fn = vim.fn

 -- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- plugins
local result = packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'      -- packer manages itself
    use 'nvim-lualine/lualine.nvim'   -- statusbar
    use 'morhetz/gruvbox'             -- colorscheme
    use 'Mofiqul/dracula.nvim'        -- colorscheme
    use 'tribela/transparent.nvim'    -- transparency
    use 'norcalli/nvim-colorizer.lua' -- highlight color codes
    use 'tpope/vim-surround'          -- motions for manipulating symbols that surround text
    use 'tpope/vim-commentary'        -- motions for commenting out lines
    -- use 'junegunn/fzf'                -- fuzzy finder
    -- use 'junegunn/fzf.vim'            -- fuzzy finder
    use 'nvim-mini/mini.pick'         -- file picker / fuzzy finder
    use 'nvim-mini/mini.completion'   -- small completion engine
    use "neovim/nvim-lspconfig"       -- a bunch of lsp configurations
    use 'stevearc/oil.nvim'           -- modify directory contents in buffer

    use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' } -- treesitter highlighting

    -- bootstrap
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
end)

-- plugin setup
require 'mini.pick'.setup({
  source = {
    file = function()
      return vim.fn.systemlist('fd --type f --hidden --exclude .git')
    end,
  }
})

require 'mini.completion'.setup()

require 'oil'.setup()

return result
