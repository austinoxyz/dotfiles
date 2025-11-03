 -- lua/austino/config/fzf.lua

-- Customize fzf colors to match your color scheme                                          
-- fzf#wrap translates this to a set of `--color` options                                 
vim.cmd "let g:fzf_colors = { 'fg': ['fg', 'Normal'], 'bg': ['bg', 'Normal'], 'hl': ['fg', 'Comment'], 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'], 'bg+': ['bg', 'CursorLine', 'CursorColumn'], 'hl+': ['fg', 'Statement'],  'info':    ['fg', 'PreProc'], 'border':  ['fg', 'Ignore'], 'prompt':  ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker':  ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header':  ['fg', 'Comment'] }"

-- Use ripgrep within FZF preview window with :Rg
-- TODO for some reason this is working by default, and the line below breaks it
--vim.cmd "command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0"

