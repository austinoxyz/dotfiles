""" init.vim
syntax enable

" highlight searches
set hlsearch

" line numbering
set number relativenumber

" don't wrap lines
set nowrap

set encoding=utf-8
set t_Co=256
set notermguicolors

" faster updates
set updatetime=300

" no hidden buffers
set hidden&

" automatically read on change
set autoread

"" tab stuff
" tabs are 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" convert tabs to spaces
set expandtab
set autoindent
set fileformat=unix

" default split locations
set splitbelow
set splitright


""" PLUGINS 
" using vim-plug
call plug#begin()
    " Making nvim pretty
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'kassio/neoterm'          " Terminal 
    Plug 'scrooloose/nerdtree'     " Directory navigator
    Plug 'puremourning/vimspector' " Debugger

    " fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    "Plug 'lervag/vimtex'
call plug#end()



""" APPERANCE

set noshowmode

" transparent background (haven't tested it for terminal emulators other than terminator)
highlight Normal ctermbg=none
highlight NonText ctermbg=none

colorscheme gruvbox

"" vim-airline stuff
"
let g:airline_theme='cool'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:bullets_enabled_file_types = ['markdown', 'text']

" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""" CONFIGS
let mapleader = " "

" toggle line wrapping
nmap <M-=> :set wrap<CR>
nmap <M-+> :set nowrap<CR>

" remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" navigate tabs
nmap <M-p> :+tabn<CR>
nmap <M-o> :-tabn<CR>

" navigate buffers
nmap <M-0> :+b<CR>
nmap <M-9> :-b<CR>

" navigate ctags
nmap <M-]> <c-]>
nmap <M-[> <c-t>

" open and close tabs
nmap <M-i> :tabnew 
nmap <M-y> :tabclose<CR>

" move curosr between windows alt Alt+[vimkey]
nnoremap <M-h> <c-w>h
nnoremap <M-l> <c-w>l
nnoremap <M-k> <c-w>k
nnoremap <M-j> <c-w>j

" move cursor between windows with arrow keys
nnoremap <Left> <c-w>h
nnoremap <Right> <c-w>l
nnoremap <Up> <c-w>k
nnoremap <Down> <c-w>j

" resize splits easier
nnoremap <leader>. 5<c-w>>
nnoremap <leader>, 5<c-w><
nnoremap <leader>= 5<c-w>+
nnoremap <leader>- 5<c-w>-

" exit terminal with esc
tnoremap <Esc> <C-\><C-n>

" edit vimrc, vertically or horizontally if desired
nnoremap <leader>`e :e   $MYVIMRC<CR>
nnoremap <leader>`v :vsp $MYVIMRC<CR>
nnoremap <leader>`h :sp  $MYVIMRC<CR>
" edit current .vimspector.json, vertically or horizontally if desired
nnoremap <leader>1e :e   ./.vimspector.json<CR>
nnoremap <leader>1v :vsp ./.vimspector.json<CR>
nnoremap <leader>1h :sp  ./.vimspector.json<CR>
" edit current Makefile, vertically or horizontally if desired
nnoremap <leader>2e :e   Makefile<CR>
nnoremap <leader>2v :vsp Makefile<CR>
nnoremap <leader>2h :sp  Makefile<CR>

" generate ctags file for cpp projects
nnoremap <leader>= :!ctags src/*.cpp include/*.hpp main.cpp<CR>

"" junegunn/fzf 

nnoremap <leader>h :FZF<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>t :Tags<CR>

" window layout

let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.85 } }

" scroll through :Files preview
let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-h:preview-up\""
" ignore .git, .vimspector.json files
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,.vimspector.json}/*"'

command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"" scrooloose/nerdtree
" mappings
nnoremap <leader>n :NERDTreeFocus<CR>


"" puremourning/vimspector
" mappings
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dp :call vimspector#Pause()<CR>
nnoremap <leader>dq :call vimspector#Stop()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
nnoremap <leader>dz :call vimspector#ClearBreakpoints()<CR>
nnoremap <S-y> :call vimspector#DownFrame()<CR>
nnoremap <S-u> :call vimspector#UpFrame()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>


""" FILETYPE ASSOCIATIONS
"" GLSL

" .vs
augroup vs_ft
    au!
    autocmd BufNewFile,BufRead *.vs     set syntax=glsl
augroup END

" .fs
augroup fs_ft
    au!
    autocmd BufNewFile,BufRead *.fs     set syntax=glsl
augroup END

"""
""" COC.VIM
"""

" Disable startup warning since nvim is up to date.
let g:coc_disable_startup_warning = 1

" allow comments in json files
auto FileType json syntax match Comment +\/\/.\+$+
set signcolumn=yes

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" From coc.vim github:
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)


"""
""" VIMTEX
"""
" TODO this is not working.

filetype plugin indent on
let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_general_options
"    \ = '`reuse-instance -forward-search @tex @line @pdf'
"let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" these are the default values
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \    '-verbose',
    \    '-file-line-error',
    \    '-synctex=1',
    \    '-interaction=nonstopmode',
    \  ],
    \}


