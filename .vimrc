set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set number
set relativenumber
set autoindent 
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set smartcase
set wildmenu 
set incsearch
set hlsearch

" turn off search highlight
nnoremap <space> :nohlsearch<CR>
" if one line stretches over 2 visual lines
" this lets you move over these visual lines
nnoremap j gj
nnoremap k gk

"for latex-suite fix grep
set grepprg=grep\ -nH\ $*

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" disable auto comment
au FileType * set fo-=c fo-=r fo-=o

" Latex specific options
"set leader to , for less finger stretching
let mapleader = "," 
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
nmap <Leader>, :call SaveAndCompile()<CR>
