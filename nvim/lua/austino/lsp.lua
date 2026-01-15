-- lua/austino/config/lsp.lua

local autocmd = vim.api.nvim_create_autocmd

vim.diagnostic.config({
  virtual_text = false, -- disable inline text
  float = {
    border = nil, -- use default border
  }
})

-- lua ------------------
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
}

autocmd('FileType', {
  pattern = { 'lua' },
  callback = function()
    vim.lsp.start(vim.lsp.config['lua_ls'])
  end
})
-------------------------

-- clangd ---------------
vim.lsp.config['clangd'] = {
  cmd = { "clangd", "--background-index", "--query-driver=/usr/bin/g++,/usr/bin/gcc" },
  filetypes = { "c", "cpp", "h", "hpp" },
  root_dir = vim.fs.root(0, {'.git', 'main.c', 'main.cpp'}),
  on_attach = function(_, bufnr)
    vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { buffer = bufnr })
  end,
}

autocmd('FileType', {
  pattern = { 'c', 'h', 'cpp', 'hpp' },
  callback = function()
    vim.lsp.start(vim.lsp.config['clangd'])
  end
})
-------------------------

-- make -----------------
-- vim.lsp.config['make'] = {
--   cmd = { 'make-lsp' },
--   filetypes = { 'make' },
--   root_dir = vim.fs.root(0, { 'Makefile', '.git' }),
-- }

-- autocmd('FileType', {
--   pattern = { 'make' },
--   callback = function()
--     vim.lsp.start(vim.lsp.config['make'])
--   end
-- })
-------------------------
