" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot' " Better syntax highlighting
Plug 'arcticicestudio/nord-vim' " Color scheme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim' " Python auto-complete
Plug 'scrooloose/nerdcommenter' " Easier commenting
Plug 'airblade/vim-gitgutter' " Show git diffs in left gutter
Plug 'preservim/nerdtree' " File explorer
call plug#end()

" Set leader as space
let mapleader=' '

" Clear highlighted searches
nnoremap <leader>, :nohlsearch<CR>

" Fuzzy search with FZF
nnoremap <leader>f :FZF<CR>

" File explorer (instead of NERDTree)
"nnoremap <leader>e :Explore<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

" Close (delete) open buffer
nnoremap <leader>q :bd<CR>

" Open grep search
nnoremap <leader>o :copen<CR>

" Move between panes/splits via JKLH
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy and paste
noremap <leader>y "*y
noremap <leader>p "*p

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

" Ignore list for vimgrep
set wildignore+=__pycache__/**,node_modules/**,env/**

" To ensure NERDComment plugin works correctly
filetype plugin on

" Disable jedi vims auto complete on 'dot'
let g:jedi#popup_on_dot = 0

" NERDCommenter
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

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Ignore certain failes
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*node_modules*,*__pycache__*
let NERDTreeRespectWildIgnore=1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  " set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

set rtp+=/usr/local/opt/fzf
