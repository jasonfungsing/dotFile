" fix the you complete me python issue
if has('python3')
  silent! python3 1
endif

set nu
set nocompatible
set laststatus=2
filetype plugin on
filetype indent on
runtime mrcros/matchit.vim
set cursorline
set showmatch
set nrformats=
set number

syntax enable

set modifiable
set suffixesadd+=.js

" natural split
set splitbelow
set splitright

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Automatically remove all trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

" Set up leader key to <,>
let mapleader = ","

" This allows buffers to be hidden if you've modified a buffer.
set hidden

" ------ NERD Tree ------
" Key mapping for open NERDTree
nmap <leader>ne :NERDTreeToggle<cr>

" Key mapping to find the current file in the tree
nmap <leader>n :NERDTreeFind<cr>

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" makes the nerdTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1

" Close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ------

" ---------- NERD Commenter -----------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" ------

" Key mapping for Dash
:nmap <silent> <leader>d <Plug>DashSearch

" Disable Arrows Keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Map Keys for Managing Buffers
" map <C-J> :bnext<CR>
" map <C-K> :bprev<CR>
" map <C-L> :tabn<CR>
" map <C-H> :tabp<CR>

" To open a new empty buffer
map <C-T> :enew<CR>

" Map keys to insert empty line without enter insert mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Map key to insert empty space without enter insert mode
:nnoremap <space> i<space><esc>

" ------ airline ------
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" ------

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'valloric/youcompleteme'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'mdempsky/gocode'
Plug 'benmills/vimux'
Plug '/usr/local/opt/fzf'
Plug 'tpope/vim-projectionist'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher <http://robots.thoughtbot.com/faster-grepping-in-vim>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>

" Map CTRL+Q to close buffer
map <C-q> :bp\|bd #<cr>
imap <C-q> <ESC>:bp\|bd #<cr>

" Map CTRL+T for tab
map <C-t> <esc>:tabnew<CR>

" Tagbar Toggle
nmap <leader>t :TagbarToggle<CR>
