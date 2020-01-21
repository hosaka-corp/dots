" =============================================================================
" General settings
" =============================================================================

" It's faster; plus, when do you ever type 'jk'? That's right - never.
imap jk <ESC>

" Use SPACE as the Leader key
let mapleader=" " 

" Skip the vim intro message
set shortmess=atI

" Use C-L to insert a lambda! (Lambdas! λ)
imap <C-l> <C-k>l*

set nocompatible
set encoding=utf-8
set laststatus=2
set ruler

" Show current keystrokes on the modeline
set showcmd

" Enable syntax highlighting and line numbers
syntax on
set number

" Highlight search results
set hlsearch
set incsearch

set laststatus=2
set modeline 

" You are a heretic if you don't use tabstop=8
set tabstop=8
set softtabstop=8
set shiftwidth=8

set noexpandtab
set undolevels=200

" Live dangerously, don't pollute our disk with swapfiles
set noswapfile

" Don't use spell-correction by default
set nospell

" Hints for better completion, sometimes
set wildignore+=*.gif,*.png,*.jpg,*.jpeg,*.mp3,*.flac,*.pdf,*.so

" Fix vsplit appearance
:set fillchars+=vert:\ 

filetype plugin indent on

" I actually have no idea what this does, lol
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" I actually have no idea what this does either, lololo
au BufNewFile,BufRead,BufReadPost *.txt set filetype=conf
 if version >= 700
   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
     au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
 endif

" Set a colorscheme!
set t_Co=256
colorscheme acme

" Preserve transparency in colorscheme
" note: this doesn't actually seem to override a colorscheme ...
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE
hi LineNr ctermbg=NONE

" BCE nonsense (fixes wierd tmux behavior?)
" if &term =~ '256color'
set t_ut=

" General movement mappings
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-l> :wincmd l<CR>

" bash readline-emacs bindings for command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-k> <C-U>

filetype plugin on
"set omnifunc=syntaxcomplete#Complete
hi Search cterm=NONE ctermfg=grey ctermbg=red
hi ColorColumn ctermbg=1

" =============================================================================
" vundle settings
" =============================================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vimwiki/vimwiki'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kshenoy/vim-signature'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf.vim'
call vundle#end()
filetype plugin indent on

" =============================================================================
" vim-gitgutter bindings
" =============================================================================

nnoremap <silent> <cr> :GitGutterNextHunk<cr>
nnoremap <silent> <backspace> :GitGutterPrevHunk<cr>

" =============================================================================
" YouCompleteMe settings
" =============================================================================

let g:ycm_max_num_candidates = 25
let g:ycm_filepath_blacklist = {'*': 1}

let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_complete_in_comments = 0
let g:ycm_keep_logfiles = 0

let g:ycm_use_clangd = 1

" =============================================================================
" fzf settings

" I'm going to use <Tab> as the leader key for fzf vim bindings.
" See `man fzf` for default bindings in fzf windows.
" =============================================================================

" Set the fzf default command for vim. 
" This invokes ag with `-g` (search for files). 
let $FZF_DEFAULT_COMMAND = 'ag --ignore="*.o" --ignore="*.bin" --ignore="*.elf" -g ""'

" extra key bindings (actions in an FZF window)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" fzf layout
" - down / up / left / right
let g:fzf_layout = { 'up': '~50%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Simple mappings
map <silent> <Tab><Tab> :Files<CR>
map <silent> <Tab>f :Ag<CR>
map <silent> <Tab>l :Lines<CR>

" =============================================================================
" cscope
" =============================================================================

" See http://vim.wikia.com/wiki/Autoloading_Cscope_Database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()
command Loadctags call LoadCscope()

" =============================================================================
" Miscellany
" =============================================================================

" Let .S files use syntax=asm
autocmd Filetype asm setlocal formatoptions+=r
autocmd BufNewFile,BufRead *.S set syntax=asm

" That one crazy vertical split thing, with <Leader>vs
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" Easy timestamp macro
command Timestamp r !date
