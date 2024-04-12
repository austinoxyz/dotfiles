 -- lua/austino/aliases.lua
vim.cmd "command! ShowRuntimePath lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))"

vim.cmd "command! -bang -nargs=* CProjGrep call fzf#vim#grep('rg include/ src/ --column --line-number --no-heading --color=always'.shellescape(<q-args>))"

