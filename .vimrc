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
Plug 'sheerun/vim-polyglot' " Better syntax highlighting
Plug 'arcticicestudio/nord-vim' " Color scheme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search tooling
Plug 'junegunn/fzf.vim' " Fuzzy search integration with Vim
Plug 'scrooloose/nerdcommenter' " Easier commenting
Plug 'airblade/vim-gitgutter' " Show git diffs in left gutter
Plug 'preservim/nerdtree' " File explorer
Plug 'vim-scripts/AutoComplPop' " Auto-show vims complete menu while typing
Plug 'dense-analysis/ale' " ESLint tooling
Plug 'tpope/vim-fugitive' " Git tooling
call plug#end()

" =================================================================================================
" GENERAL SETTINGS
" =================================================================================================

" Set <leader> command to space bar.
let mapleader=' '

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

" Dont try to be compatible with Vi
set nocompatible

" Highlight cursor line
set cursorline

" How many lines of history vim remembers
set history=100

" Try to indent correctly when hitting enter
set autoindent

" Highlight matching brackets
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

" Disable vim backups/swaps
set nobackup
set nowb
set noswapfile

" Split more naturally
set splitbelow
set splitright

" Ignore list for vimgrep
set wildignore+=__pycache__/**,node_modules/**,env/**

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" =================================================================================================
" MAPPINGS
" =================================================================================================

" Clear highlighted searches
nnoremap <leader>, :nohlsearch<CR>

" Fuzzy file search with FZF
nnoremap <leader>f :FZF<CR>

" Fuzzy string search with ripgrep
nnoremap <leader>s :Rg 

" File explorer
nnoremap <leader>e :NERDTreeToggle<CR>

" Quick fix eslint issues with ALE
nnoremap <leader>x :ALEFix<CR>

" Close (delete) open buffer
nnoremap <leader>q :bd<CR>

" Open quickfix pane
nnoremap <leader>o :copen<CR>

" Move between panes/splits via JKLH
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy and paste to system clipboard
noremap <leader>y "*y
noremap <leader>p "*p

" Replace word under cursor or selected phrase, repeatable with '.' command
" Similar to 'multi-cursor' in other editors
nnoremap <leader>r :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <leader>r "sy:let @/=@s<CR>cgn

" =================================================================================================
" THEME SETTINGS
" =================================================================================================

" Color scheme / theme tweaks
set termguicolors
set t_Co=256
colorscheme nord

" =================================================================================================
" LANGUAGE SETTINGS
" =================================================================================================

" Set Python files to use 4 spaces
autocmd filetype python set expandtab
autocmd filetype python set shiftwidth=4
autocmd filetype python set tabstop=4

" =================================================================================================
" PLUGIN SETTINGS
" =================================================================================================

" To ensure NERDComment plugin works correctly
filetype plugin on

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

" Ignore these files in file explorer
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*node_modules*,*__pycache__*,*.git*,*.bundle*
let NERDTreeRespectWildIgnore=1

" Make file explorer window a bit smaller
let g:NERDTreeWinSize=25

" Set ALE lint tooling to use eslint only
let g:ale_fixers = ['eslint']

" Set airline to same theme as Vim
let g:airline_theme='nord'

" Tell vim where FZF bin is located
set rtp+=/usr/local/opt/fzf

