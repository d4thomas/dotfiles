hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "term16"

if &background ==# 'dark'
  hi Normal        ctermfg=7                 ctermbg=NONE
  hi Comment       ctermfg=8
  hi Constant      ctermfg=6
  hi String        ctermfg=2
  hi Identifier    ctermfg=4
  hi Function      ctermfg=4
  hi Statement     ctermfg=1                 cterm=bold
  hi PreProc       ctermfg=5
  hi Type          ctermfg=3
  hi Special       ctermfg=13
  hi Todo          ctermfg=0   ctermbg=11    cterm=bold
  hi LineNr        ctermfg=8   ctermbg=NONE
  hi CursorLineNr  ctermfg=11  ctermbg=NONE
  hi Visual        ctermfg=0   ctermbg=12
  hi StatusLine    ctermfg=0   ctermbg=7     cterm=bold
  hi StatusLineNC  ctermfg=8   ctermbg=7     cterm=NONE
else
  hi Normal        ctermfg=0   ctermbg=NONE
  hi Comment       ctermfg=8
  hi Constant      ctermfg=4
  hi String        ctermfg=2
  hi Identifier    ctermfg=1
  hi Function      ctermfg=1
  hi Statement     ctermfg=1                 cterm=bold
  hi PreProc       ctermfg=5
  hi Type          ctermfg=6
  hi Special       ctermfg=13
  hi Todo          ctermfg=15  ctermbg=3     cterm=bold
  hi LineNr        ctermfg=8   ctermbg=NONE
  hi CursorLineNr  ctermfg=4   ctermbg=NONE
  hi Visual        ctermfg=15  ctermbg=12
  hi StatusLine    ctermfg=15  ctermbg=0     cterm=bold
  hi StatusLineNC  ctermfg=8   ctermbg=0     cterm=NONE
endif

hi CursorLine   ctermbg=8
hi MatchParen   ctermfg=0      ctermbg=11
hi Search       ctermfg=0      ctermbg=10
hi IncSearch    ctermfg=0      ctermbg=13
hi Pmenu        ctermfg=15     ctermbg=0
hi PmenuSel     ctermfg=0      ctermbg=4
hi Folded       ctermfg=6                    ctermbg=NONE
hi Title        ctermfg=3                    cterm=bold

hi! link Operator     Statement
hi! link Number       Constant
hi! link Boolean      Constant
hi! link Underlined   Identifier
hi! link Error        Todo
hi! link WarningMsg   Todo
hi! link VisualNOS    Visual
