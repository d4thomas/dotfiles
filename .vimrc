set nocompatible

" Enable syntax highlighting
syntax on

" Increase memory for pattern matching
set maxmempattern=150000

" Set colorscheme
let g:dark_theme = 'colors'
let g:light_theme = 'colors'
function! SetTheme()
    let theme = system("defaults read -g AppleInterfaceStyle 2>/dev/null | tr -d '\\n'")
    if theme ==# 'Dark'
        set background=dark
        execute 'colorscheme ' . g:dark_theme
    else
        set background=light
        execute 'colorscheme ' . g:light_theme
    endif
endfunction
autocmd VimEnter * call SetTheme()
command! RefreshTheme call SetTheme()
autocmd FocusGained * call SetTheme()

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

" Hide EOB chatacters
let &fillchars ..= ',eob: '
set fillchars=eob:\ 

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

" Keymaps
map <Tab> :bnext<cr>
map <S-Tab> :bprevious<cr>
map <leader>bd :bdelete<cr>
map <leader>bc :enew<cr>
map <leader>bl :ls<cr>
nnoremap <Esc><Esc> :nohlsearch<CR>
nmap <silent> <up> gk
nmap <silent> <down> gj
nnoremap y "+y
vnoremap y "+y
nnoremap p "+p

" When wrapping, try to break at characters in breakat
set linebreak

" When wrapping, break at these characters
set breakat=\^I!@*-+;:,./?

" Character to show that a line is wrapped
set showbreak=»»»

" Highlight search matches
set incsearch hlsearch

" Enable autoindenting
set ai

" Backspace over anything
set backspace=indent,eol,start

" Return to last edit position
autocmd BufReadPost *
    \ let line = line("'\"")
    \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
    \       && index(['xxd', 'gitrebase'], &filetype) == -1
    \ |     execute "normal! g`\""
    \ | endif

" Enable persistent undo
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undodir=~/.vim/undodir
set undofile

" Set tab width
set tabstop=4
set shiftwidth=4
set expandtab

" Configure line numbers
set number
