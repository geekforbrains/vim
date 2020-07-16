call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot' " Better syntax highlighting
Plug 'arcticicestudio/nord-vim' " Color scheme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'junegunn/fzf' " Fuzzy search
Plug 'davidhalter/jedi-vim' " Python auto-complete
Plug 'scrooloose/nerdcommenter' " Easier commenting
call plug#end()

" Set leader as space
let mapleader=' '

" Clear highlighted searches
nnoremap <leader>, :nohlsearch<CR>

" Fuzzy search with FZF
nnoremap <leader>f :FZF<CR>

" File explorer (instead of NERDTree)
nnoremap <leader>e :Explore<CR>

" Close (delete) open buffer
nnoremap <leader>q :bd<CR>

" Open grep search
nnoremap <leader>o :copen<CR>

" Move between panes/splits via JKLH
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Color scheme / theme tweaks
set termguicolors
set t_Co=256
colorscheme nord
let g:airline_theme='nord'

" Fix backspace so it deletes as expected
set backspace=indent,eol,start

" Syntax highlighting
syntax on

" Show line numbers
set number

" How many lines of history vim remembers
set history=100

" Autoindent duh
set autoindent

" Show matching brackets
set showmatch

" Show current position
set ruler

" Highlight search results
set hlsearch

" Set vertical ruler
set colorcolumn=100

" Use spaces insead of tabs when using tab key
set expandtab
set shiftwidth=2
set tabstop=2

" Set Python files to use 4 spaces
autocmd filetype python set expandtab
autocmd filetype python set shiftwidth=4
autocmd filetype python set tabstop=4

" Disable vim backups/swaps
set nobackup
set nowb
set noswapfile

" Split more naturally
set splitbelow
set splitright

" File explorer config
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide= '__pycache__/,.git/,env/'

" Ignore list for vimgrep
set wildignore+=__pycache__/**,node_modules/**,env/**

" To ensure NERDComment plugin works correctly
filetype plugin on

" Disable jedi vims auto complete on 'dot'
let g:jedi#popup_on_dot = 0
