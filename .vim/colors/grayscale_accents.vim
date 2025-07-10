" Grayscale color scheme with blue/red accents
" Name: grayscale_accents.vim

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "grayscale_accents"

" Universal colors
hi Normal ctermfg=NONE ctermbg=NONE
hi NonText ctermfg=237
hi SpecialKey ctermfg=237
hi Directory ctermfg=248 cterm=bold
hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
hi CursorLine ctermbg=NONE cterm=underline
hi CursorColumn ctermbg=233
hi Visual ctermfg=248 ctermbg=237 cterm=NONE
hi VisualNOS ctermfg=248 ctermbg=237 cterm=NONE
hi LineNr ctermfg=241
hi CursorLineNr ctermfg=248 cterm=bold
hi SignColumn ctermfg=241 ctermbg=NONE
hi ColorColumn ctermbg=233
hi Folded ctermfg=241 ctermbg=233
hi FoldColumn ctermfg=241 ctermbg=NONE
hi StatusLine ctermfg=NONE ctermbg=NONE cterm=reverse,bold
hi StatusLineNC ctermfg=241 ctermbg=233
hi VertSplit ctermfg=237 ctermbg=237
hi WildMenu ctermfg=248 ctermbg=237 cterm=bold
hi TabLine ctermfg=241 ctermbg=233 cterm=none
hi TabLineFill ctermfg=237 ctermbg=237
hi TabLineSel ctermfg=248 ctermbg=NONE cterm=bold
hi Pmenu ctermfg=248 ctermbg=237
hi PmenuSel ctermfg=248 ctermbg=233 cterm=bold
hi PmenuSbar ctermbg=237
hi PmenuThumb ctermbg=248

" Messages and errors
hi ErrorMsg ctermfg=196 ctermbg=NONE cterm=bold
hi WarningMsg ctermfg=196 ctermbg=NONE cterm=bold
hi ModeMsg ctermfg=248 cterm=bold
hi MoreMsg ctermfg=248 cterm=bold
hi Question ctermfg=248 cterm=bold

" Search and matching
hi Search ctermfg=248 ctermbg=237 cterm=NONE
hi IncSearch ctermfg=248 ctermbg=233 cterm=bold
hi MatchParen ctermfg=196 ctermbg=NONE cterm=bold

" Diff colors
hi DiffAdd ctermfg=34 ctermbg=none cterm=bold
hi DiffChange ctermfg=220 ctermbg=none cterm=bold
hi DiffDelete ctermfg=196 ctermbg=none cterm=bold
hi DiffText ctermfg=220 ctermbg=none cterm=bold,underline

" Spell checking
hi SpellBad ctermfg=196 cterm=underline
hi SpellCap ctermfg=220 cterm=underline
hi SpellLocal ctermfg=51 cterm=underline
hi SpellRare ctermfg=201 cterm=underline

" Syntax highlighting
hi Comment ctermfg=241 cterm=italic
hi Constant ctermfg=248
hi String ctermfg=248
hi Character ctermfg=248
hi Boolean ctermfg=248
hi Identifier ctermfg=NONE
hi Function ctermfg=248
hi Statement ctermfg=248
hi Conditional ctermfg=248
hi Repeat ctermfg=248
hi Label ctermfg=248
hi Operator ctermfg=NONE
hi Keyword ctermfg=248
hi Exception ctermfg=248
hi PreProc ctermfg=248
hi Include ctermfg=248
hi Define ctermfg=248
hi Macro ctermfg=248
hi PreCondit ctermfg=248
hi Type ctermfg=248
hi StorageClass ctermfg=248
hi Structure ctermfg=248
hi Typedef ctermfg=248
hi Special ctermfg=248
hi SpecialChar ctermfg=248
hi Tag ctermfg=248
hi SpecialComment ctermfg=241 cterm=italic
hi Debug ctermfg=248
hi Underlined ctermfg=NONE cterm=underline
hi Ignore ctermfg=241
hi Error ctermfg=196 ctermbg=NONE cterm=bold
hi Todo ctermfg=NONE ctermbg=NONE cterm=reverse,bold

" Accent for numbers and delimiters
hi Number ctermfg=75 ctermbg=NONE cterm=NONE
hi Float ctermfg=75 ctermbg=NONE
hi Delimiter ctermfg=196 ctermbg=NONE

" Set up syntax matching for numbers and delimiters
autocmd FileType * call s:SetAccent()

function! s:SetAccent()
  " Match all number formats
  syntax match AccentNumber "\<\d\+\>" containedin=ALL
  syntax match AccentNumber "\<\d\+\.\d*\>" containedin=ALL
  syntax match AccentNumber "\<\.\d\+\>" containedin=ALL
  syntax match AccentNumber "\<\d\+[eE][+-]\?\d\+\>" containedin=ALL
  syntax match AccentNumber "\<\d\+\.\d*[eE][+-]\?\d\+\>" containedin=ALL
  syntax match AccentNumber "\<\.\d\+[eE][+-]\?\d\+\>" containedin=ALL
  syntax match AccentNumber "\<0[xX][0-9a-fA-F]\+\>" containedin=ALL
  syntax match AccentNumber "\<0[bB][01]\+\>" containedin=ALL
  syntax match AccentNumber "\<0[oO][0-7]\+\>" containedin=ALL

  " Match all bracket types
  syntax match AccentDelims "[()\[\]{}<>]" containedin=ALL

  " Apply accent highlighting
  hi AccentNumber ctermfg=75 ctermbg=NONE
  hi AccentDelims ctermfg=196 ctermbg=NONE
endfunction
