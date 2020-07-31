set nocompatible
filetype plugin indent on
filetype off

call plug#begin('~/.vim/plugged')

" Functionality Plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim'
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'php'] }
Plug 'markonm/traces.vim'

" Syntax and Themes Plugins
Plug 'sheerun/vim-polyglot'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ap/vim-css-color', { 'for': ['css', 'html', 'javascript', 'php'] }
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

call plug#end()

" Commands
command W w !sudo tee % > /dev/null
command Y %w !xclip -selection clipboard

" Settings for Syntax
colorscheme palenight

" Airline
let g:airline_powerline_fonts = 1

set encoding=utf-8
set rnu nu
set noshowmode
set noshowcmd
set backspace=indent,eol,start
set laststatus=1
set cmdheight=1
set autoindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set background=dark
set termguicolors
set statusline+=%#warningmsg#
set showmatch
set title
set t_Co=256 " 256 colors

" Trailing whitespaces
set listchars=eol:↵,trail:~,tab:▷\ ,nbsp:○
set list
match errorMsg /\s\+$/

" COC.nvim
set updatetime=500
set shortmess+=c
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ALE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 500
let g:ale_pattern_options = {
    \ '.*node_modules.*$': {'ale_enabled': 0},
\ }

" vim-json
let g:vim_json_syntax_conceal = 0

" javascript.vim
let g:javascript_plugin_jsdoc = 1

" NERDTree
let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

" CTRLP.vim
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git\|dist\|vendor\|node_modules\|build$'
\ }

" Map's
let mapleader = ","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>
map <C-p> :CtrlP<CR>
map <leader>h :noh<CR>
