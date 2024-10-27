set nocompatible

" Plugins
call plug#begin()

Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

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
  " Set background colors to terminal background
  hi Normal guibg=#0a0e14
  hi SignColumn guibg=bg
endfunction
syntax on
autocmd Vimrc colorscheme * call Hi()

" Set colorscheme
let ayucolor="dark"
colorscheme ayu

" Airline configuration
let g:airline_theme='ayu'
let g:airline_extensions=[]
let g:airline_powerline_fonts=1
let g:airline_section_a='%n'
let g:airline_section_b='%{&ff}'
let g:airline_section_c='%y %<%F'
let g:airline_section_x='%m %l/%L'
let g:airline_section_y='%v'
let g:airline_section_z='0x%04B'

" Filetype settings
filetype on
filetype indent on
filetype plugin on

" Disable comment formatting
au BufEnter * set fo-=c fo-=r fo-=o

" Enable omni completion
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,noinsert,noselect

" Show white spaces
set listchars=tab:>·,trail:·,extends:>,precedes:<
set list

" Status line
set statusline=
set statusline+=%1*\ %n\ %*   " Buffer number
set statusline+=%5*%{&ff}%*   " File format
set statusline+=%3*%y%*       " File type
set statusline+=%4*\ %<%F%*   " Full path
set statusline+=%2*%m%*       " Modified flag
set statusline+=%1*%=%5l%*    " Current line
set statusline+=%2*/%L%*      " Total lines
set statusline+=%1*%4v\ %*    " Virtual column number
set statusline+=%2*0x%04B\ %* " Character under cursor

" Enable mouse support
set mouse=a

" Share clipboard with OS
set clipboard^=unnamed

" Always show status line
set laststatus=2

" Set leader keymap
let mapleader =" "

" Buffer keymaps
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
map <leader>bd :bdelete<cr>
map <leader>bc :enew<cr>
map <leader>bl :ls<cr>

" When wrapping, try to break at characters in breakat
set linebreak

" When wrapping, break at these characters
set breakat=\^I!@*-+;:,./?

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
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

" Highlight line when in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Backspace over anything
set backspace=indent,eol,start

" Return to last edit position
autocmd BufReadPost *
  \ let line = line("'\"")
  \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
  \      && index(['xxd', 'gitrebase'], &filetype) == -1
  \ |    execute "normal! g`\""
  \ | endif

" Enable persistent undo
if !isdirectory($HOME."/.vim/undodir")
  call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undodir=~/.vim/undodir
set undofile

" CoC configuration
source ~/.vim/coc.vim
let g:coc_start_at_startup=0
set pumheight=7

" Toggle CoC
function! ToggleCoc()
  if coc#rpc#ready()
    call coc#rpc#stop()
    echo "CoC Disabled"
  else
    execute 'CocStart'
    echo "CoC Enabled"
  endif
endfunction

" CoC keymaps
nnoremap <leader>coc :call ToggleCoc()<cr>

" Copilot configuration
let g:copilot_enabled=0
let g:copilot_no_tab_map=v:true

" Toggle Copilot
function! ToggleCopilot()
  if g:copilot_enabled
    let g:copilot_enabled=0
    echo "CoPilot Disabled"
  else
    let g:copilot_enabled=1
    echo "Copilot Enabled"
  endif
endfunction

" Copilot keymaps
nnoremap <leader>cp :call ToggleCopilot()<cr>
imap <silent><script><expr> <c-a> copilot#Accept("\<cr>")
imap <C-]> <Plug>(copilot-next)
