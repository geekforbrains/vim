execute pathogen#infect()

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Set color scheme (found in ~/.vim/colors/)
colorscheme monokai

" Add 80 char ruler 
set colorcolumn=80

" Open NERDTree when Vim starts
autocmd vimenter * NERDTree

" Setup CtrlP and NERDTree to play nicely
let g:NERDTreeChDirMode=2
let g:ctrlp_working_path_mode='a'

" Setup shortcut for CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Set search to be by name instead of path
let g:ctrlp_by_filename=1

" Enable syntax highlightin
syntax on

" Enable line numbers on the left
set number
set autoindent

" Use spaces instead of real tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
