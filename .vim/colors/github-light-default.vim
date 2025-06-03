set background=light
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "github-light-default"

" Core UI
hi Normal       guifg=#24292e guibg=#ffffff ctermfg=16 ctermbg=231
hi Cursor       guifg=#ffffff guibg=#0969da ctermfg=231 ctermbg=26
hi Visual       guibg=#cce5ff ctermbg=153
hi LineNr       guifg=#d0d7de guibg=#ffffff ctermfg=252 ctermbg=231
hi CursorLine   guibg=#f6f8fa ctermbg=254 gui=NONE cterm=NONE
hi CursorLineNr guifg=#6e7781 guibg=#f6f8fa gui=NONE ctermfg=243 ctermbg=254 cterm=NONE
hi StatusLine   guifg=#57606a guibg=#f6f8fa gui=bold ctermfg=242 ctermbg=254
hi StatusLineNC guifg=#d8dee4 guibg=#f6f8fa ctermfg=252 ctermbg=254
hi VertSplit    guifg=#d8dee4 guibg=#f6f8fa ctermfg=252 ctermbg=254
hi Pmenu        guifg=#1f2328 guibg=#f6f8fa ctermfg=16 ctermbg=254
hi PmenuSel     guifg=#ffffff guibg=#0969da ctermfg=231 ctermbg=26
hi PmenuSbar    guibg=#d0d7de ctermbg=252
hi PmenuThumb   guibg=#8c959f ctermbg=245

" Search
hi Search       guifg=#1f2328 guibg=#fff2be ctermfg=16 ctermbg=229
hi IncSearch    guifg=#ffffff guibg=#0969da gui=bold ctermfg=231 ctermbg=26

" Matching
hi MatchParen   guifg=#1f2328 guibg=#d2eaff ctermfg=16 ctermbg=153

" Syntax
hi Comment      guifg=#6e7781 gui=italic ctermfg=245
hi Constant     guifg=#0550ae ctermfg=25
hi String       guifg=#0a3069 ctermfg=24
hi Character    guifg=#0550ae ctermfg=25
hi Number       guifg=#0550ae ctermfg=25
hi Boolean      guifg=#0550ae ctermfg=25
hi Identifier   guifg=#0a3069 ctermfg=24
hi Function     guifg=#8250df ctermfg=98
hi Statement    guifg=#cf222e gui=bold ctermfg=160
hi Conditional  guifg=#cf222e ctermfg=160
hi Repeat       guifg=#cf222e ctermfg=160
hi Label        guifg=#cf222e ctermfg=160
hi Operator     guifg=#24292f ctermfg=16
hi Keyword      guifg=#cf222e gui=bold ctermfg=160
hi Exception    guifg=#cf222e ctermfg=160
hi PreProc      guifg=#cf222e ctermfg=160
hi Include      guifg=#cf222e ctermfg=160
hi Define       guifg=#cf222e ctermfg=160
hi Macro        guifg=#cf222e ctermfg=160
hi Type         guifg=#116329 ctermfg=28
hi StorageClass guifg=#0550ae ctermfg=25
hi Structure    guifg=#0550ae ctermfg=25
hi Typedef      guifg=#0550ae ctermfg=25
hi Special      guifg=#24292f ctermfg=16
hi Delimiter    guifg=#57606a ctermfg=242
hi Underlined   guifg=#0969da gui=underline ctermfg=26
hi Error        guifg=#ffffff guibg=#cf222e ctermfg=231 ctermbg=160
hi Todo         guifg=#ffffff guibg=#9a6700 ctermfg=231 ctermbg=130

" Diffs
hi DiffAdd      guibg=#ddf4ff ctermbg=153
hi DiffChange   guibg=#fff8c5 ctermbg=229
hi DiffDelete   guifg=#82071e guibg=#ffeef0 ctermfg=88 ctermbg=217
hi DiffText     guibg=#c2e0ff ctermbg=153

" GitGutter/SignColumn
hi SignColumn   guibg=#ffffff ctermbg=231
hi GitGutterAdd    guifg=#116329 ctermfg=28
hi GitGutterChange guifg=#bf8700 ctermfg=136
hi GitGutterDelete guifg=#82071e ctermfg=88

" Markdown
hi markdownHeadingDelimiter guifg=#0550ae gui=bold ctermfg=25
hi markdownCode             guifg=#24292f guibg=#f6f8fa ctermfg=16 ctermbg=254
hi markdownCodeBlock        guifg=#24292f guibg=#f6f8fa ctermfg=16 ctermbg=254
