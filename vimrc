set nocompatible
syntax off
set wrap
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
Plug 'raimondi/delimitmate'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'blade', 'html.twig'] }

" Autocompletion
Plug 'lifepillar/vim-mucomplete'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax and Themes Plugins
Plug 'sheerun/vim-polyglot'
" Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

call plug#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""
" Configuration section
"""""""""""""""""""""""""""""""""""""

" Colorscheme
colorscheme gruvbox

" Complete option menu
set completeopt=menu

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
set termguicolors

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
" set showmatch

" Set the filename in the title of the terminal
set title

" Preview for replaces
" set inccommand=split

" Map leader
let mapleader = ","

" Perfomance settings
set lazyredraw
set ttyfast
" set regexpengine=1
set foldmethod=manual

"""""""""""""""""""""""""""""""""""""
" Plugin configuration section
"""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_powerline_fonts = 1

" vim-mucomplete
set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = { 'default':
            \ [ 'ulti','omni','tags','keyn','keyp','path','line'] }

" ultisnips
let g:UltiSnipsExpandTrigger="<C-right>"
let g:UltiSnipsJumpForwardTrigger="<C-right>"
let g:UltiSnipsJumpBackwardTrigger="<C-left>"

fun! TryUltiSnips()
    let g:ulti_expand_or_jump_res = 0
    if !pumvisible() " With the pop-up menu open, let Tab move down
        call UltiSnips#ExpandSnippetOrJump()
    endif
    return ''
endf

fun! TryMUcomplete()
    return g:ulti_expand_or_jump_res ? "" : "\<plug>(MUcompleteFwd)"
endf

let g:mucomplete#no_mappings  = 1 " Don't do any mappings I will do it myself

" Extend completion
imap <expr> <S-tab> mucomplete#extend_fwd("\<right>")

" Cycle through completion chains
imap <unique> <c-'> <plug>(MUcompleteCycFwd)
imap <unique> <c-;> <plug>(MUcompleteCycBwd)

" Try to expand snippet, if fails try completion.
inoremap <plug>(TryUlti) <c-r>=TryUltiSnips()<cr>
imap <expr> <silent> <plug>(TryMU) TryMUcomplete()
imap <expr> <silent> <tab> "\<plug>(TryUlti)\<plug>(TryMU)"
" Map tab in select mode as well, otherwise you won't be able to jump if a snippet place
" holder has default value.
snoremap <silent> <tab> <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>
" Autoexpand if completed keyword is a snippet
inoremap <silent> <expr> <plug>MyCR mucomplete#ultisnips#expand_snippet("\<cr>")
imap <cr> <plug>MyCR

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = 'W'
let g:airline#extensions#ale#enabled = 1
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

" ALE
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
