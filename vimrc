filetype plugin on
filetype indent on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#rc(expand(vimDir . '/bundle'))

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tcomment_vim'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neocomplcache.vim'
Plugin 'kaicataldo/material.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
" Plugin 'MaxMEllon/vim-jsx-pretty'
" Plugin 'StanAngeloff/php.vim'
" Plugin 'hail2u/vim-css3-syntax'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'

command W w !sudo tee % > /dev/null
command Q q!
syntax enable

set nocompatible

set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

set completeopt=longest,menuone
set wildmode=longest,list,full

set clipboard=unnamedplus

set number

set autoread

set backspace=indent,eol,start

set laststatus=2
set noshowmode

set encoding=utf-8

set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" Standard:
" autocmd FileType javascript,css set shiftwidth=2
" autocmd FileType javascript,css set tabstop=2
" autocmd FileType javascript,css set softtabstop=2

set cursorline

set matchpairs+=<:>

set hlsearch
set incsearch
set ignorecase
set smartcase

set scrolloff=5

set listchars=eol:$
" set list

set t_Co=256
set background=dark
if (has('termguicolors'))
  set termguicolors
endif

set langmenu=en
let $LANG='en'

set wildignore=*.o,*~,*.pyc
if has('win16') || has('win32')
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set statusline+=%#warningmsg#

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_javascript_checkers = [ 'standard' ]
let g:syntastic_go_checkers = [ 'golint' ]
let g:syntastic_python_checkers = [ 'pylint' ]
let g:syntastic_html_checkers = [ 'htmlhint' ]
" let g:syntastic_html_checkers = [ 'validator' ]

let g:javascript_plugin_jsdoc = 1

" Autocomplete plugins
let g:neocomplete#enable_at_startup = 1 " Neocomplete
let g:neocomplcache_enable_at_startup = 1 " Neocomplcache

let g:lightline = { 'colorscheme': 'material_vim' }

let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1

let g:jsx_ext_required = 1

" Navigation keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call vundle#end()

" Avoid <Esc> key
" imap ii <Esc>
" vmap ii <Esc>

colorscheme material

map <C-n> :NERDTreeToggle<CR>
