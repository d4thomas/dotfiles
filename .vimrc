set nocompatible

" Plugins
call plug#begin()

Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Set colorscheme
set t_Co=256
set termguicolors
colorscheme codedark

" Filetype settings
filetype on
filetype indent on
filetype plugin on

" Enable omni completion
set omnifunc=syntaxcomplete#Complete

" Show white spaces
set listchars=tab:>·,trail:·,extends:>,precedes:<
set list

" Status line
set statusline=
set statusline +=%1*\ %n\ %*   " Buffer number
set statusline +=%5*%{&ff}%*   " File format
set statusline +=%3*%y%*       " File type
set statusline +=%4*\ %<%F%*   " Full path
set statusline +=%2*%m%*       " Modified flag
set statusline +=%1*%=%5l%*    " Current line
set statusline +=%2*/%L%*      " Total lines
set statusline +=%1*%4v\ %*    " Virtual column number
set statusline +=%2*0x%04B\ %* " Character under cursor

" Enable mouse support
set mouse=a

" Always show status line
set laststatus=2

" Buftabline key maps
set hidden
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" When wrapping, try to break at characters in breakat
set linebreak

" When wrapping, break at these characters
set breakat=\ ^I!@*-+;:,./?

" Character to show that a line is wrapped
set showbreak=»»»

" Highlight search matches
set incsearch hlsearch

" Show line numbers
set nu

" Enable syntax highlighting
syntax on

" Set dark background
set background=dark

" Enable autoindenting
set ai

" Switch cursor when in insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Highlight line when in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Backspace over anything
set backspace=indent,eol,start
