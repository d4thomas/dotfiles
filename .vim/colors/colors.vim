hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "colors"

let s:palette = {
  \ 'bg':          '#faf4f1',
  \ 'fg':          '#28242a',
  \ 'cursor':      '#706a6d',
  \ 'sel_bg':      '#beb9b9',
  \ 'sel_fg':      '#28242a',
  \ 'red':         '#e14674',
  \ 'green':       '#259c69',
  \ 'yellow':      '#cc790a',
  \ 'orange':      '#e15f32',
  \ 'magenta':     '#7057bd',
  \ 'cyan':        '#1c8ba7',
  \ 'black':       '#28242a',
  \ 'brightgrey':  '#a49fa0'
  \ }

execute 'hi Normal         guifg=' . s:palette.fg         . ' guibg=' . s:palette.bg
execute 'hi Cursor         guifg=' . s:palette.bg         . ' guibg=' . s:palette.cursor
execute 'hi Visual         guifg=' . s:palette.sel_fg     . ' guibg=' . s:palette.sel_bg
execute 'hi LineNr         guifg=' . s:palette.brightgrey . ' guibg=' . s:palette.bg
execute 'hi CursorLineNr   guifg=' . s:palette.orange     . ' guibg=' . s:palette.bg
execute 'hi StatusLine     guifg=' . s:palette.fg         . ' guibg=' . s:palette.brightgrey
execute 'hi VertSplit      guifg=' . s:palette.brightgrey . ' guibg=' . s:palette.bg
execute 'hi Pmenu          guifg=' . s:palette.fg         . ' guibg=' . s:palette.red
execute 'hi PmenuSel       guifg=' . s:palette.bg         . ' guibg=' . s:palette.orange

execute 'hi Comment        guifg=' . s:palette.brightgrey . ' cterm=italic gui=italic'
execute 'hi Constant       guifg=' . s:palette.magenta
execute 'hi String         guifg=' . s:palette.green
execute 'hi Character      guifg=' . s:palette.green
execute 'hi Number         guifg=' . s:palette.orange
execute 'hi Boolean        guifg=' . s:palette.orange
execute 'hi Float          guifg=' . s:palette.orange

execute 'hi Identifier     guifg=' . s:palette.cyan
execute 'hi Function       guifg=' . s:palette.magenta

execute 'hi Statement      guifg=' . s:palette.red
execute 'hi Conditional    guifg=' . s:palette.red
execute 'hi Repeat         guifg=' . s:palette.red
execute 'hi Label          guifg=' . s:palette.orange
execute 'hi Operator       guifg=' . s:palette.black
execute 'hi Keyword        guifg=' . s:palette.red
execute 'hi Exception      guifg=' . s:palette.red

execute 'hi PreProc        guifg=' . s:palette.cyan
execute 'hi Include        guifg=' . s:palette.cyan
execute 'hi Define         guifg=' . s:palette.cyan
execute 'hi Macro          guifg=' . s:palette.cyan

execute 'hi Type           guifg=' . s:palette.yellow
execute 'hi StorageClass   guifg=' . s:palette.yellow
execute 'hi Structure      guifg=' . s:palette.yellow
execute 'hi Typedef        guifg=' . s:palette.yellow

execute 'hi Special        guifg=' . s:palette.orange
execute 'hi SpecialChar    guifg=' . s:palette.orange
execute 'hi Tag            guifg=' . s:palette.orange
execute 'hi Delimiter      guifg=' . s:palette.fg
execute 'hi SpecialComment guifg=' . s:palette.brightgrey

execute 'hi Underlined     guifg=' . s:palette.cyan       . ' cterm= underline gui=underline'
execute 'hi Ignore         guifg=' . s:palette.brightgrey
execute 'hi Error          guifg=' . s:palette.brightgrey . ' guibg=' . s:palette.red
execute 'hi Todo           guifg=' . s:palette.bg         . ' guibg=' . s:palette.yellow . ' gui=bold'