filetype plugin indent on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'raimondi/delimitmate'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'StanAngeloff/php.vim'
Plugin 'fatih/vim-go'
Plugin 'chrisbra/csv.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'ap/vim-css-color'

call vundle#end()

command W w !sudo tee % > /dev/null
command Y %w !xclip -selection clipboard
syntax enable

set nocompatible
set completeopt=longest,menuone
set wildmode=longest,list,full
set clipboard=unnamedplus
set number
set autoread
set backspace=indent,eol,start
set laststatus=1
set noshowmode
set encoding=utf-8
set autoindent
augroup filetypedetect
	au! BufRead,BufNewFile *.csv setfiletype csv
augroup END
set matchpairs+=<:>
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set background=dark
set termguicolors
set statusline+=%#warningmsg#
set lazyredraw
set showmatch
set nobackup
set noswapfile
set title
set hidden
set noerrorbells
set fillchars+=vert:\┊

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
	\	'javascript': [ 'standard' ],
	\	'go': [ 'golint' ],
	\	'python': [ 'pylint' ],
	\	'css': [ 'csslint' ],
	\	'sh': [ 'shellcheck' ],
\ }

let g:vim_json_syntax_conceal = 0

let g:javascript_plugin_jsdoc = 1

let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1

let g:jsx_ext_required = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme palenight

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '┊'
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = 'Vim'
let g:airline#extensions#tabline#formatter = 'unique_tail'

map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
map <C-t> :IndentGuidesToggle<CR>
