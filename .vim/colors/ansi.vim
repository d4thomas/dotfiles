set background=light

hi clear

let g:colors_name = 'ansi'
set notermguicolors

" Color Key
" 0: Black        │   8: Bright Black (dark gray)
" 1: Red          │   9: Bright Red
" 2: Green        │  10: Bright Green
" 3: Yellow       │  11: Bright Yellow
" 4: Blue         │  12: Bright Blue
" 5: Magenta      │  13: Bright Magenta
" 6: Cyan         │  14: Bright Cyan
" 7: White (gray) │  15: Bright White

" UI: General Interface Elements
hi NonText ctermfg=0
hi SpecialKey ctermfg=0
hi Directory ctermfg=4
hi Conceal ctermfg=8
hi LineNr ctermfg=8
hi CursorLineNr ctermfg=6
hi FoldColumn ctermfg=7
hi Folded ctermfg=12
hi SignColumn ctermfg=7
hi ColorColumn ctermbg=8
hi CursorLine ctermbg=0 ctermfg=NONE
hi CursorColumn ctermbg=0
hi Cursor ctermbg=15 ctermfg=0
hi MatchParen ctermbg=0 ctermfg=3 cterm=underline
hi Visual ctermbg=8 ctermfg=15 cterm=bold
hi VisualNOS ctermbg=8 ctermfg=15 cterm=bold
hi TabLine ctermfg=7 ctermbg=0 cterm=NONE
hi TabLineFill ctermfg=0 ctermbg=NONE
hi TabLineSel ctermfg=15 ctermbg=NONE cterm=italic
hi VertSplit ctermfg=8
hi Title ctermfg=4 cterm=bold
hi Underlined cterm=underline
hi Bold cterm=bold
hi Italic cterm=italic

" UI: Status Lines, Messages & Modes
hi StatusLine ctermfg=15 ctermbg=8 cterm=NONE
hi StatusLineNC ctermfg=15 ctermbg=0 cterm=NONE
hi WildMenu ctermbg=0 ctermfg=15 cterm=NONE
hi ModeMsg ctermfg=7 ctermbg=NONE cterm=bold
hi MsgArea ctermfg=15 ctermbg=NONE
hi MsgSeparator ctermfg=7 ctermbg=NONE cterm=NONE
hi MoreMsg ctermfg=7 ctermbg=NONE cterm=NONE
hi Question ctermfg=4
hi ToolbarLine ctermbg=0 ctermfg=15
hi ToolbarButton ctermbg=8 ctermfg=15
hi InsertMode ctermfg=7 ctermbg=NONE cterm=bold
hi VisualMode ctermfg=7 ctermbg=NONE cterm=bold
hi ReplaceMode ctermfg=7 ctermbg=NONE cterm=bold

" UI: Popup Menu
hi Pmenu ctermbg=0 ctermfg=15
hi PmenuSel ctermbg=8 ctermfg=15 cterm=bold
hi PmenuSbar ctermbg=8 ctermfg=7
hi PmenuThumb ctermbg=7 ctermfg=NONE

" UI: Search & Highlighting
hi IncSearch ctermbg=1 ctermfg=0
hi CurSearch ctermbg=3 ctermfg=0
hi Search ctermbg=11 ctermfg=0

" UI: Help & Documentation
hi helpLeadBlank ctermbg=NONE ctermfg=NONE
hi helpNormal ctermbg=NONE ctermfg=NONE

" Messages & Diagnostics
hi ErrorMsg ctermfg=1 ctermbg=NONE cterm=bold,italic
hi WarningMsg ctermfg=11
hi healthError ctermfg=1
hi healthWarning ctermfg=3
hi healthSuccess ctermfg=2

" Diff Mode
hi DiffAdd ctermbg=10 ctermfg=0
hi DiffChange ctermbg=12 ctermfg=0
hi DiffDelete ctermbg=9 ctermfg=0
hi DiffText ctermbg=14 ctermfg=0
hi diffAdded ctermfg=10
hi diffRemoved ctermfg=9
hi diffChanged ctermfg=12
hi diffOldFile ctermfg=11
hi diffNewFile ctermfg=13
hi diffFile ctermfg=12
hi diffLine ctermfg=7
hi diffIndexLine ctermfg=14

" Spell Checking
hi SpellBad cterm=undercurl
hi SpellCap cterm=undercurl
hi SpellLocal cterm=undercurl
hi SpellRare cterm=undercurl

" Debugging
hi debugPC ctermfg=7
hi debugBreakpoint ctermfg=8

" Other / Misc
hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE

" Core syntax
hi Comment ctermfg=8 cterm=italic
hi Constant ctermfg=3
hi String ctermfg=2
hi Boolean ctermfg=3
hi Number ctermfg=3
hi Identifier ctermfg=9
hi Function ctermfg=4
hi Statement ctermfg=5
hi Conditional ctermfg=5
hi Repeat ctermfg=5
hi Label ctermfg=14
hi Operator ctermfg=6
hi Keyword ctermfg=5
hi Exception ctermfg=5
hi PreProc ctermfg=13
hi Include ctermfg=5
hi Define ctermfg=5
hi Macro ctermfg=5
hi Type ctermfg=11
hi StorageClass ctermfg=11
hi Structure ctermfg=11
hi Typedef ctermfg=11
hi Special ctermfg=13
hi SpecialChar ctermfg=13
hi Error ctermfg=1 ctermbg=NONE cterm=bold
hi Todo ctermfg=0 ctermbg=9

" Java / Javadoc
hi javaDocComment ctermfg=8 cterm=italic
hi javaDocTag ctermfg=13 cterm=bold
hi javaClassDecl ctermfg=11 cterm=bold
hi javaAnnotation ctermfg=12
hi javaType ctermfg=11
hi javaStorageClass ctermfg=5
hi javaOperator ctermfg=6

" JavaScript / TypeScript
hi jsFunction ctermfg=4
hi jsFuncName ctermfg=4
hi jsClassDefinition ctermfg=11
hi jsClassKeyword ctermfg=5
hi jsObjectProp ctermfg=9
hi jsThis ctermfg=14 cterm=bold
hi typescriptKeyword ctermfg=5
hi typescriptType ctermfg=11
hi typescriptInterface ctermfg=13
hi typescriptBoolean ctermfg=3

" Python
hi pythonFunction ctermfg=4
hi pythonBuiltinFunc ctermfg=13
hi pythonImport ctermfg=5
hi pythonRepeat ctermfg=5
hi pythonConditional ctermfg=5
hi pythonException ctermfg=1
hi pythonStatement ctermfg=5
hi pythonString ctermfg=2

" C / C++ / Rust
hi cType ctermfg=11
hi cStorageClass ctermfg=5
hi cConditional ctermfg=5
hi cOperator ctermfg=6
hi cppType ctermfg=11
hi cppSTL ctermfg=14
hi cppStructure ctermfg=11
hi rustFunction ctermfg=4
hi rustModPath ctermfg=9
hi rustKeyword ctermfg=5
hi rustStorage ctermfg=5
hi rustType ctermfg=11

" Go
hi goFunction ctermfg=4
hi goType ctermfg=11
hi goStatement ctermfg=5
hi goConditional ctermfg=5
hi goRepeat ctermfg=5
hi goBuiltins ctermfg=13

" HTML / XML / CSS / JSON
hi htmlTag ctermfg=5
hi htmlEndTag ctermfg=5
hi htmlTagName ctermfg=11
hi htmlArg ctermfg=14
hi xmlTagName ctermfg=11
hi xmlAttrib ctermfg=13
hi cssClassName ctermfg=13
hi cssIdentifier ctermfg=9
hi jsonKeyword ctermfg=5
hi jsonString ctermfg=2
hi jsonNumber ctermfg=3

" Lua
hi luaFunction ctermfg=4
hi luaStatement ctermfg=5
hi luaTable ctermfg=9
hi luaConstant ctermfg=3

" Shell / Bash
hi shFunction ctermfg=4
hi shStatement ctermfg=5
hi shConditional ctermfg=5
hi shVariable ctermfg=9
hi shQuote ctermfg=2

" SQL
hi sqlKeyword ctermfg=5
hi sqlFunction ctermfg=4
hi sqlType ctermfg=11
hi sqlString ctermfg=2
hi sqlStatement ctermfg=5

" Markdown
hi markdownHeadingDelimiter ctermfg=5 cterm=bold
hi markdownBold ctermfg=13 cterm=bold
hi markdownItalic ctermfg=14 cterm=italic
hi markdownCode ctermfg=2
hi markdownLinkText ctermfg=12