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
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml'] }
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'php', 'xml'] }
Plug 'fatih/vim-go', { 'for': 'go' }

" Syntax and Themes Plugins
Plug 'sheerun/vim-polyglot'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

if $SSH_CONNECTION
    " Plug 'chriskempson/base16-vim'
    Plug 'vim-airline/vim-airline-themes'
endif

call plug#end()

" Commands
command W w !sudo tee % > /dev/null
command Y %w !xclip -selection clipboard

" Settings for Syntax
if $SSH_CONNECTION
    colorscheme elflord
    set nolist
else
    colorscheme palenight
endif

" Airline
if ! $SSH_CONNECTION
    let g:airline_powerline_fonts = 1
endif

set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
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
set nolazyredraw
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
set inccommand=split " Preview of replaces|
set t_Co=256 " 256 colors
let mapleader = ","

" Trailing whitespaces
if ! $SSH_CONNECTION
    set listchars=eol:↵,trail:\ ,tab:▷\ ,nbsp:○
    set list
    match errorMsg /\s\+$/
endif

" COC.nvim
set updatetime=500
set shortmess+=c

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index([‘vim’,’help’], &filetype) >= 0)
        execute ‘h ‘.expand(‘<cword>’)
    else
        call CocAction(‘doHover’)
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ALE
if $SSH_CONNECTION
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'
else
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
endif
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 500
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

" CTRLP.vim
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git\|dist\|vendor\|node_modules\|build$'
\ }

" vim-go
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 1
let g:go_code_completion_enabled = 1

" Map's
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>
map <C-p> :CtrlP<CR>
map <leader>h :noh<CR>
