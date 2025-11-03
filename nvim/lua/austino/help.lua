-- lua/austino/help.lua

-- make :help pages splitbelow
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { 'help' },
  callback = function()
    if vim.bo.buftype == 'help' then
      vim.cmd('wincmd J')
    end
  end
})

