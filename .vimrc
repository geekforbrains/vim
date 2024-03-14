" =================================================================================================
" PLUGINS
" =================================================================================================

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
Plug 'arcticicestudio/nord-vim' " Color scheme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search tooling
Plug 'junegunn/fzf.vim' " Fuzzy search integration with Vim
Plug 'scrooloose/nerdcommenter' " Easier commenting
Plug 'preservim/nerdtree' " File explorer
Plug 'scrooloose/syntastic' " Catch syntax errors, unused imports, etc
Plug 'majutsushi/tagbar' " Tag browser
Plug 'tpope/vim-fugitive' " Git tooling in Vim
Plug 'valloric/youcompleteme' " Autocompletion and jump to definition
Plug 'github/copilot.vim' " Github Copilot / AI
call plug#end()

" =================================================================================================
" GENERAL SETTINGS
" =================================================================================================

" Syntax highlighting
syntax on

" Fix backspace so it deletes as expected
set backspace=indent,eol,start

" Dont ask to save when switching buffers
set hidden

" Show line numbers
set number

" Ignore case when quick searching
set ignorecase

" Show quick search results as we type
set incsearch

" Highlight cursor line
set cursorline

" How many lines of history vim remembers
set history=100

" Highlight matching brackets
set showmatch

" Show current position
set ruler

" Set vertical ruler
set colorcolumn=100

" Highlight search results
set hlsearch

" Disable vim backups/swaps
set nobackup
set nowb
set noswapfile

" Split more naturally
set splitbelow
set splitright

" Better tab-completion when searching
"set path=.,**
"set wildmenu
"set wildmode=list:longest,full
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*node_modules*,*__pycache__*,*.git*,*.bundle*,env

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" =================================================================================================
" MAPPINGS
" =================================================================================================

" Set <leader> command to space bar.
let mapleader=' '

" File explorer
nnoremap <leader>e :NERDTreeToggle<CR>

" Fuzzy file search with FZF
nnoremap <leader>f :FZF<CR>

" Fuzzy string search with ripgrep
nnoremap <leader>s :Rg

" Clear highlighted searches
nnoremap <leader>, :nohlsearch<CR>

" Show tag browser
nnoremap <leader>t :TagbarToggle<CR>

" Go to definition with YCM (Ctrl+o to go back, Ctrl+i to go forward)
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Move between panes/splits via JKLH
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy and paste to system clipboard
noremap <leader>y "*y
noremap <leader>p "*p

" =================================================================================================
" THEME SETTINGS
" =================================================================================================

set termguicolors
set t_Co=256
colorscheme nord

" =================================================================================================
" LANGUAGE FORMAT SETTINGS
" =================================================================================================

" Better indenting
set autoindent

" Enable filetype detection
filetype on
filetype plugin on
filetype indent on

" As default, use 2 spaces instead of tabs when using tab key
set expandtab
set shiftwidth=2
set tabstop=2

" Set Python files to use 4 spaces
autocmd FileType python set expandtab
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4

" =================================================================================================
" PLUGIN SETTINGS
" =================================================================================================

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

" Show dotfiles
let NERDTreeShowHidden=1

" Respect wildignore settings for ignore files
let NERDTreeRespectWildIgnore=1

" Make file explorer window a bit smaller
let g:NERDTreeWinSize=28

" Set airline to same theme as Vim
let g:airline_theme='nord'

" Tell vim where FZF bin is located
set rtp+=/usr/local/opt/fzf

" Improve FZF results
let $FZF_DEFAULT_COMMAND="find . -type f | grep -v '/env/' | grep -v '/\.git/' | grep -v '.pyc$' | grep -v '/\.cache/'"

" Disable YCM auto complete (can still do manually with Ctrl+Space)
let g:ycm_auto_trigger = 0

" Setup copilot to learn from my other projects
let g:copilot_workspace_folders = ["~/Projects"]
