set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'monokai-pro-light'

function! s:h(face, guibg, guifg, ctermbg, ctermfg, gui)
  let l:cmd="highlight " . a:face

  if a:guibg != ""
    let l:cmd = l:cmd . " guibg=" . a:guibg
  endif

  if a:guifg != ""
    let l:cmd = l:cmd . " guifg=" . a:guifg
  endif

  if a:ctermbg != ""
    let l:cmd = l:cmd . " ctermbg=" . a:ctermbg
  endif

  if a:ctermfg != ""
    let l:cmd = l:cmd . " ctermfg=" . a:ctermfg
  endif

  if a:gui != ""
    let l:cmd = l:cmd . " gui=" . a:gui
  endif

  exec l:cmd
endfun

let s:hex = {}
let s:bit = {}

let s:hex.color0="#faf4f2"
let s:hex.color1="#29242a"
let s:hex.color2="#cdc7c5"
let s:hex.color3="#f0eae8"
let s:hex.color4="#c8c2c0"
let s:hex.color5="#e6e0de"
let s:hex.color6="#b4aeac"
let s:hex.color7="#d9d3d1"
let s:hex.color8="#7d787a"
let s:hex.color9="#c0bab8"
let s:hex.color10="#645f61"
let s:hex.color11="#afa9a7"
let s:hex.color12="#3ab17d"
let s:hex.color13="#dcd6d4"
let s:hex.color14="#0b060c"
let s:hex.color15="#1f1a20"
let s:hex.color16="#d7d1cf"
let s:hex.color17="#a59fa0"
let s:hex.color18="#7058be"
let s:hex.color19="#269d69"
let s:hex.color20="#e14775"
let s:hex.color21="#cc7a0a"

let s:bit.color16="35"
let s:bit.color15="61"
let s:bit.color10="72"
let s:bit.color4="145"
let s:bit.color17="168"
let s:bit.color18="172"
let s:bit.color5="188"
let s:bit.color11="232"
let s:bit.color12="234"
let s:bit.color1="235"
let s:bit.color8="241"
let s:bit.color6="243"
let s:bit.color14="247"
let s:bit.color9="248"
let s:bit.color7="250"
let s:bit.color2="251"
let s:bit.color13="252"
let s:bit.color3="254"
let s:bit.color0="255"

call s:h("Normal", s:hex.color0, s:hex.color1, s:bit.color0, s:bit.color1, "none")
call s:h("Cursor", s:hex.color1, s:hex.color0, s:bit.color1, s:bit.color0, "none")
call s:h("Visual", s:hex.color2, "", s:bit.color2, "", "none")
call s:h("ColorColumn", s:hex.color3, "", s:bit.color0, "", "none")
call s:h("LineNr", "", s:hex.color4, "", s:bit.color2, "none")
call s:h("CursorLine", s:hex.color5, "", s:bit.color3, "", "none")
call s:h("CursorLineNr", "", s:hex.color6, "", s:bit.color4, "none")
call s:h("CursorColumn", s:hex.color5, "", s:bit.color3, "", "none")
call s:h("StatusLineNC", s:hex.color7, s:hex.color8, s:bit.color5, s:bit.color6, "none")
call s:h("StatusLine", s:hex.color9, s:hex.color10, s:bit.color7, s:bit.color8, "none")
call s:h("VertSplit", "", s:hex.color11, "", s:bit.color9, "none")
call s:h("Folded", s:hex.color5, s:hex.color12, s:bit.color3, s:bit.color10, "none")
call s:h("Pmenu", s:hex.color13, s:hex.color14, s:bit.color5, s:bit.color11, "none")
call s:h("PmenuSel", s:hex.color3, s:hex.color15, s:bit.color0, s:bit.color12, "none")
call s:h("EndOfBuffer", s:hex.color0, s:hex.color16, s:bit.color0, s:bit.color13, "none")
call s:h("NonText", s:hex.color0, s:hex.color16, s:bit.color0, s:bit.color13, "none")
call s:h("MatchParen", s:hex.color0, s:hex.color18, "", "", "bold")
call s:h("Comment", "", s:hex.color17, "", s:bit.color14, "none")
call s:h("Constant", "", s:hex.color18, "", s:bit.color15, "none")
call s:h("Special", "", s:hex.color18, "", s:bit.color15, "none")
call s:h("Identifier", "", s:hex.color1, "", s:bit.color1, "none")
call s:h("Function", "", s:hex.color19, "", s:bit.color16, "none")
call s:h("Statement", "", s:hex.color20, "", s:bit.color17, "none")
call s:h("Operator", "", s:hex.color20, "", s:bit.color17, "none")
call s:h("PreProc", "", s:hex.color20, "", s:bit.color17, "none")
call s:h("Type", "", s:hex.color20, "", s:bit.color17, "none")
call s:h("String", "", s:hex.color21, "", s:bit.color18, "none")
call s:h("Number", "", s:hex.color18, "", s:bit.color15, "none")

highlight link cStatement Statement
highlight link cSpecial Special
