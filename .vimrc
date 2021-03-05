set nocompatible              " be iMproved, required


syntax on

set number
set autoindent 
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set smartcase
set wildmenu 
set incsearch
set hlsearch
set clipboard=unnamedplus 
" turn off search highlight
nnoremap <leader><CR> :nohlsearch<CR>
" if one line stretches over 2 visual lines
" this lets you move over these visual lines
nnoremap j gj
nnoremap k gk

nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>


" disable auto comment
" au FileType * set fo-=c fo-=r fo-=o
" au BufRead,BufNewFile

nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <C-b> :YcmCompleter GoTo<CR>
nnoremap <C-l> <C-i>
nnoremap <C-h> <C-o>

let g:AutoPairsFlyMode = 0

nmap <Leader>/ :Ack 
nmap <C-P> :FZF<CR>

set tw=79
set formatoptions-=t
set laststatus=2
set statusline+=%f

autocmd CompleteDone * pclose

" for vim-table-mode compatible with markdown 
let g:table_mode_corner="|"

"for fzf.vim plugin
set rtp+=~/.fzf

" highlight Normal ctermbg=none ctermfg=none
" highlight NonText ctermbg=none
" highlight LineNr ctermbg=none

hi MatchParen cterm=bold ctermbg=none ctermfg=red

set nocp 

" nmap <Leader>r :highlight OverLength ctermbg=red ctermfg=white<CR>
" nmap <Leader>h :highlight OverLength ctermbg=none ctermfg=none<CR>
" highlight OverLength ctermbg= ctermfg=none

set ignorecase
set tabpagemax=100

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" au FileType xhtml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'


" The following are examples of different formats supported.
" Git plugin not hosted on GitHub

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype off
filetype plugin indent on    " required
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

