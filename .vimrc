set nocompatible

" Plugins
call plug#begin()

Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Setup Vim for colorscheme
set t_Co=256
set termguicolors

" Configure highlights
augroup Vimrc
  autocmd!
augroup END
function Hi()
  " Add italics
  hi Comment cterm=italic
  hi Conditional cterm=italic
  hi Identifier cterm=italic
  hi Repeat cterm=italic
  hi Statement cterm=italic
  hi Type cterm=italic
  hi htmItalic cterm=italic
  hi markdownItalic cterm=italic
  " Set background color to terminal background
  hi Normal guibg=#0a0e14
endfunction
syntax on
autocmd Vimrc colorscheme * call Hi()

" Set colorscheme
let ayucolor="dark"
colorscheme ayu

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

" Buffer key maps
map gn :bnext<cr>
map gp :bprevious<cr>
map gd :bdelete<cr>
map gc :enew<cr>

" When wrapping, try to break at characters in breakat
set linebreak

" When wrapping, break at these characters
set breakat=\ ^I!@*-+;:,./?

" Character to show that a line is wrapped
set showbreak=»»»

" Highlight search matches
set incsearch hlsearch

" Configure line numbers
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

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
