" Install plugins first (using vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'phanviet/vim-monokai-pro'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
call plug#end()

" Shortcuts
" Clear highlighted searches
nnoremap <space>/ :nohlsearch<CR>

" Fuzzy search with FZF
nnoremap <space>f :FZF<CR>

" Strict search with FZF
nnoremap <space>s :FZF -e<CR>

" New tab
nnoremap <space>t :tabnew<CR>

" Tab left
nnoremap <space>h :tabprevious<CR>

" Tab right
nnoremap <space>l :tabnext<CR>

" Color scheme / theme
set termguicolors
set t_Co=256
colorscheme monokai_pro
let g:lightline = {'colorscheme': 'monokai_pro'}

" Syntax highlighting
syntax on

" Show line numbers
set number

" How many lines of history vim remembers
set history=100

" Update files changed outside vim
set autoread

" Autoindent duh
set autoindent

" Show matching brackets
set showmatch

" Show current position
set ruler

" Highlight search results
set hlsearch

" Set vertical ruler to 80
set colorcolumn=100

" Use spaces insead of tabs when using tab key
set expandtab
set shiftwidth=2
set tabstop=2

" Set Python files to use 4 spaces
autocmd Filetype python set shiftwidth=4|set tabstop=4

" Disable vim backups/swaps
set nobackup
set nowb
set noswapfile

" Ignore files in NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'env']

" Close NERDTree after I open a file from it
let NERDTreeQuitOnOpen=1

