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
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'           -- packer manages itself
    use 'morhetz/gruvbox'                  -- colorscheme
    use 'Mofiqul/dracula.nvim'             -- colorscheme
    use 'nvim-lualine/lualine.nvim'        -- statusbar
    use 'nvim-tree/nvim-web-devicons'      -- icons
    use 'nvim-tree/nvim-tree.lua'          -- file manager
    use 'prichrd/netrw.nvim'               -- better netrw (directory navigator)
    -- use 'puremourning/vimspector'          -- debugger
    -- use 'nvim-neotest/nvim-nio'            -- asyncio (required by nvim-dap-ui)
    -- use 'mfussenegger/nvim-dap'            -- debugger
    -- use 'rcarriga/nvim-dap-ui'             -- debugger ui
    use 'junegunn/fzf'                     -- fuzzy finder
    use 'junegunn/fzf.vim'                 -- fuzzy finder
    use 'junegunn/goyo.vim'                -- center text and remove distractions
    use 'norcalli/nvim-colorizer.lua'      -- highlight color codes
    use 'tpope/vim-surround'               -- motions for manipulating symbols that surround text
    use 'tpope/vim-commentary'             -- motions for commenting out lines
    use { 'mg979/vim-visual-multi', branch='master' }          -- multiple cursors
    use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' } -- treesitter highlighting

    use { "lervag/vimtex", lazy=false }

    -- luarocks
    use_rocks 'luaposix'

    use 'tribela/transparent.nvim'

    -- bootstrap
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
end)
