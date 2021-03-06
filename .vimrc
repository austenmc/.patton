set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree.git'
Plugin 'wincent/command-t'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Disable modelines just in case I encounter security issues with such files.
set modelines=0

" Remap the leader.
let mapleader = ","

" Easy access to vimrc
nmap <leader>ev :tabedit ~/.vimrc<cr>

" Edit my journal
nmap <leader>ej :tabedit ~/Dropbox (Personal)/journal.txt

" Change to lotgd directory
nmap <leader>cl :cd ~/lotgd

" For simplicity of accessing :
nnoremap ; :

" Tabs
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" Losing focus on the window should save
au FocusLost * :wa

" Windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
" Be able to close the window if only NERDTree is open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<cr>

" Features
" set undofile
" et wildmenu

" CommandT
let g:CommandTFileScanner='watchman'
let g:CommandTMaxCachedDirectories=10
let g:CommandTMaxFiles=200000

" Clang Complete
" For Objective-C, this needs to be active, otherwise multi-parameter methods won't be completed correctly
let g:clang_snippets = 1

" Appearance and themes.
set laststatus=2
set number
syntax enable
set background=dark
colorscheme onedark
let g:airline_theme = 'onedark'
set guifont=IBMPlexMono:h16
set guioptions=                                       " Remove gui scrollbars.

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Special handling for text files.
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufRead,BufNewFile *.txt,*.tex,*.md set wrap linebreak nolist textwidth=0 wrapmargin=0
autocmd FileType markdown nnoremap <buffer> j gj
autocmd FileType markdown nnoremap <buffer> k gk
autocmd FileType markdown nnoremap <buffer> $ g$
autocmd FileType markdown set nonumber
