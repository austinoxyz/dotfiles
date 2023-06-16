 -- lua/austino/aliases.lua

vim.cmd "command! ShowRuntimePath lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))"
vim.cmd "command! -nargs=1 OpenCTab tabnew include/<args>.h | vsp src/<args>.c"
