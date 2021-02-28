set nocompatible
syntax on
set nowrap
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""
" Plugins Configuraion
"""""""""""""""""""""""""""""""""""""
filetype off

call plug#begin('~/.vim/plugged')

" Functionality Plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
" Plug 'majutsushi/tagbar'
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'blade', 'html.twig'] }

" Syntax and Themes Plugins
Plug 'sheerun/vim-polyglot'
" Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
" Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

call plug#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""
" Configuration section
"""""""""""""""""""""""""""""""""""""

" Colorscheme
colorscheme gruvbox

" No backup
set nobackup
set nowritebackup
set noswapfile

" Show line numbers
set number

" Show relative numbers
" set relativenumber

set noshowmode
set noshowcmd

set backspace=indent,eol,start

" Show colors
if (has("termguicolors"))
  set termguicolors
endif

" Always disable the status line
set laststatus=1
set cmdheight=1

" Enable highlighting of the current line
" set cursorline

" Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Improve search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Scroll better
set scrolloff=5

" Dark background
set background=dark

" Set the warning message of Ale plugin in the status line
set statusline+=%#warningmsg#

" Match the brackets
set showmatch

" Set the filename in the title of the terminal
set title

" Preview for replaces
" set inccommand=split

" Map leader
let mapleader = ","

" Perfomance settings
set lazyredraw

"""""""""""""""""""""""""""""""""""""
" Plugin configuration section
"""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_powerline_fonts = 1

" COC.nvim
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = 'W'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_disable_lsp = 1
let g:ale_lint_on_enter = 0
let g:ale_pattern_options = {
    \ '.*.git.*$': {'ale_enabled': 0},
    \ '.*dist.*$': {'ale_enabled': 0},
    \ '.*vendor.*$': {'ale_enabled': 0},
    \ '.*node_modules.*$': {'ale_enabled': 0},
    \ '.*build.*$': {'ale_enabled': 0}
\ }

" NERDTree
let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" CTRLP.vim
" let g:ctrlp_custom_ignore = {
"     \ 'dir': '\.git\|dist\|vendor\|node_modules\|build$'
" \ }

"""""""""""""""""""""""""""""""""""""
" Shorcuts setion
"""""""""""""""""""""""""""""""""""""

" Windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable the search selection
map <leader>h :noh<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
" map <C-t> :TagbarToggle<CR>

" CTRLP.vim
" map <C-p> :CtrlP<CR>

" ALE
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
