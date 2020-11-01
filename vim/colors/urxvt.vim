" Scheme: Jan T. Sott (http://github.com/idleberg)

if !has('gui_running')"{{{
  if exists("g:base16_shell_path")
    execute "silent !/bin/sh ".g:base16_shell_path."/base16-3024.".&background.".sh"
  endif
endif
" GUI color definitions"}}}
let s:gui00 = "090300""{{{
let s:gui01 = "3a3432"
let s:gui02 = "4a4543"
let s:gui03 = "5c5855"
let s:gui04 = "807d7c"
let s:gui05 = "a5a2a2"
let s:gui06 = "d6d5d4"
let s:gui07 = "f7f7f7"
let s:gui08 = "db2d20"
let s:gui09 = "e8bbd0"
let s:gui0A = "fded02"
let s:gui0B = "01a252"
let s:gui0C = "b5e4f4"
let s:gui0D = "01a0e4"
let s:gui0E = "a16a94"
let s:gui0F = "cdab53"
"}}}

let s:black1 = "00"
let s:black2 = "08"
let s:red1 = "01"
let s:red2 = "09"
let s:green1 = "02"
let s:green2 = "10"
let s:yellow1 = "03"
let s:yellow2 = "11"
let s:blue1 = "04"
let s:blue2 = "12"
let s:purple1 = "05"
let s:purple2 = "13"
let s:cyan1 = "06"
let s:cyan2 = "14"
let s:white1 = "07"
let s:white2 = "15"
let s:blackblack = "228"

" Theme setup
hi clear
syntax reset
let g:colors_name = "urxvt"

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . s:gui(a:guifg)
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" Return GUI color for light/dark variants
fun s:gui(color)
  if &background == "dark"
    return a:color
  endif
" TEST

  if a:color == s:gui00
    return s:gui07
  elseif a:color == s:gui01
    return s:gui06
  elseif a:color == s:gui02
    return s:gui05
  elseif a:color == s:gui03
    return s:gui04
  elseif a:color == s:gui04
    return s:gui03
  elseif a:color == s:gui05
    return s:gui02
  elseif a:color == s:gui06
    return s:gui01
  elseif a:color == s:gui07
    return s:gui00
  endif

  return a:color
endfun

" Return terminal color for light/dark variants
fun s:cterm(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:black1
    return s:white2
  elseif a:color == s:green2
    return s:purple2
  elseif a:color == s:yellow2
    return s:white1
  elseif a:color == s:black2
    return s:blue2
  elseif a:color == s:blue2
    return s:black2
  elseif a:color == s:white1
    return s:yellow2
  elseif a:color == s:purple2
    return s:green2
  elseif a:color == s:white2
    return s:black1
  endif

  return a:color
endfun

" Vim editor colors
call <sid>hi("Bold",          "", "", "", "", "bold")
call <sid>hi("Debug",         s:gui08, "", s:red1, "", "")
call <sid>hi("Directory",     s:gui0D, "", s:yellow1, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, s:red1, s:black1, "")
call <sid>hi("Exception",     s:gui08, "", s:cyan1, "", "")
call <sid>hi("FoldColumn",    "", s:gui01, "", s:black1, "")
call <sid>hi("Folded",        s:gui03, s:gui01, s:blackblack, s:black1, "")
call <sid>hi("IncSearch",     s:gui01, s:gui09, s:green2, s:red2, "none")
call <sid>hi("Italic",        "", "", "", "", "none")
call <sid>hi("Macro",         s:gui08, "", s:yellow1, "", "")
call <sid>hi("MatchParen",    s:gui00, s:gui03, s:black1, s:black2,  "")
call <sid>hi("ModeMsg",       s:gui0B, "", s:green1, "", "")
call <sid>hi("MoreMsg",       s:gui0B, "", s:green1, "", "")
call <sid>hi("Question",      s:gui0D, "", s:blue1, "", "")
call <sid>hi("Search",        s:gui03, s:gui0A, s:black2, s:yellow1,  "")
call <sid>hi("SpecialKey",    s:gui03, "", s:black2, "", "")
call <sid>hi("TooLong",       s:gui08, "", s:red1, "", "")
call <sid>hi("Underlined",    s:gui08, "", s:red1, "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:yellow2, "")
call <sid>hi("VisualNOS",     s:gui08, "", s:red1, "", "")
call <sid>hi("WarningMsg",    s:gui08, "", s:red1, "", "")
call <sid>hi("WildMenu",      s:gui08, "", s:red1, "", "")
call <sid>hi("Title",         s:gui0D, "", s:blue1, "", "none")
call <sid>hi("Conceal",       s:gui0D, s:gui00, s:blue1, s:black1, "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:red2, s:blue2, "")
call <sid>hi("NonText",       s:gui03, "", s:black2, "", "")
call <sid>hi("Normal",        s:gui05, s:gui00, s:white1, "", "")
call <sid>hi("LineNr",        s:gui03, s:gui01, s:black2, "", "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:black2, s:green2, "")
call <sid>hi("SpecialKey",    s:gui03, "", s:black2, "", "")
call <sid>hi("StatusLine",    s:gui04, s:gui02, s:black2, "none", "none")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:black2, s:green1, "none")
call <sid>hi("VertSplit",     s:gui02, s:gui02, s:black1, s:black1, "none")
" the nerdtree split ^^
call <sid>hi("ColorColumn",   "", s:gui01, "", s:green2, "none")
call <sid>hi("CursorColumn",  "", s:gui01, "", s:green2, "none")
call <sid>hi("CursorLine",    "", s:gui01, "", s:black1, "none")
call <sid>hi("CursorLineNr",  s:gui03, s:gui01, s:yellow2, s:black1, "")
call <sid>hi("PMenu",         s:gui04, s:gui01, s:blue2, s:green2, "none")
call <sid>hi("PMenuSel",      s:gui01, s:gui04, s:green2, s:blue2, "")
call <sid>hi("TabLine",       s:gui03, s:gui01, s:black2, s:black1, "none")
call <sid>hi("TabLineFill",   s:gui03, s:gui01, s:black2, s:black1, "none")
call <sid>hi("TabLineSel",    s:gui0B, s:gui01, s:cyan1, s:black1, "none")
call <sid>hi("TabLineSelNC",    s:gui0B, s:gui01, s:cyan1, s:black2, "none")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:red2, "", "")
call <sid>hi("Character",    s:gui08, "", s:cyan1, "", "")
call <sid>hi("Comment",      s:gui03, "", s:black2, "", "")
call <sid>hi("Conditional",  s:gui0E, "", s:purple1, "", "")
call <sid>hi("Constant",     s:gui09, "", s:white1, "", "")
call <sid>hi("Define",       s:gui0E, "", s:purple1, "", "none")
call <sid>hi("Delimiter",    s:gui0F, "", s:purple2, "", "")
call <sid>hi("Float",        s:gui09, "", s:white1, "", "")
call <sid>hi("Function",     s:gui0D, "", s:red2, "", "bold")
call <sid>hi("Identifier",   s:gui08, "", s:yellow2, "", "none")
call <sid>hi("Include",      s:gui0D, "", s:red1, "", "")
call <sid>hi("Keyword",      s:gui0E, "", s:purple1, "", "")
call <sid>hi("Label",        s:gui0A, "", s:yellow1, "", "")
call <sid>hi("Number",       s:gui09, "", s:green2, "", "bold")
call <sid>hi("Operator",     s:gui05, "", s:white1, "", "none")
call <sid>hi("PreProc",      s:gui0A, "", s:cyan2, "", "bold")
call <sid>hi("Repeat",       s:gui0A, "", s:yellow1, "", "")
call <sid>hi("Special",      s:gui0C, "", s:yellow2, "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cyan2, "", "")
call <sid>hi("Statement",    s:gui08, "", s:green2, "", "")
call <sid>hi("StorageClass", s:gui0A, "", s:yellow1, "", "")
call <sid>hi("String",       s:gui0B, "", s:white1, "", "")
call <sid>hi("Structure",    s:gui0E, "", s:purple1, "", "")
call <sid>hi("Tag",          s:gui0A, "", s:yellow1, "", "")
call <sid>hi("Todo",         s:gui0A, s:gui01, s:yellow1, s:green2, "")
call <sid>hi("Type",         s:gui0A, "", s:red1, "", "bold")
call <sid>hi("Typedef",      s:gui0A, "", s:yellow1, "", "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", s:cyan1, "", "")
call <sid>hi("cPreCondit",  s:gui0E, "", s:purple1, "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "", s:white1, "", "")
call <sid>hi("cssClassName",   s:gui0E, "", s:purple1, "", "")
call <sid>hi("cssColor",       s:gui0C, "", s:cyan1, "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0B, s:gui01,  s:green1, s:green2, "")
call <sid>hi("DiffChange",   s:gui03, s:gui01,  s:black2, s:green2, "")
call <sid>hi("DiffDelete",   s:gui08, s:gui01,  s:red1, s:green2, "")
call <sid>hi("DiffText",     s:gui0D, s:gui01,  s:blue1, s:green2, "")
call <sid>hi("DiffAdded",    s:gui0B, s:gui00,  s:green1, s:black1, "")
call <sid>hi("DiffFile",     s:gui08, s:gui00,  s:red1, s:black1, "")
call <sid>hi("DiffNewFile",  s:gui0B, s:gui00,  s:green1, s:black1, "")
call <sid>hi("DiffLine",     s:gui0D, s:gui00,  s:blue1, s:black1, "")
call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  s:red1, s:black1, "")

" Git highlighting
call <sid>hi("gitCommitOverflow",  s:gui08, "", s:red1, "", "")
call <sid>hi("gitCommitSummary",   s:gui0B, "", s:green1, "", "")
  
" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui0B, s:gui01, s:green1, s:green2, "")
call <sid>hi("GitGutterChange",  s:gui0D, s:gui01, s:blue1, s:green2, "")
call <sid>hi("GitGutterDelete",  s:gui08, s:gui01, s:red1, s:green2, "")
call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui01, s:purple1, s:green2, "")

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "", s:yellow1, "", "")
call <sid>hi("htmlItalic",  s:gui0E, "", s:purple1, "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:white1, "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:white1, "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", s:white1, "", "")
call <sid>hi("javaScriptBraces",  s:gui05, "", s:white1, "", "")
call <sid>hi("javaScriptNumber",  s:gui09, "", s:red2, "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", s:green1, "", "")
call <sid>hi("markdownError",             s:gui05, s:gui00, s:white1, s:black1, "")
call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:green1, "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:blue1, "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", s:blue1, "", "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:white1, "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", s:white1, "", "")
call <sid>hi("phpComparison",      s:gui05, "", s:white1, "", "")
call <sid>hi("phpParent",          s:gui05, "", s:white1, "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", s:purple1, "", "")
call <sid>hi("pythonRepeat",    s:gui0E, "", s:purple1, "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", s:blue1, "", "")
call <sid>hi("rubyConstant",                s:gui0A, "", s:yellow1, "", "")
call <sid>hi("rubyInterpolation",           s:gui0B, "", s:green1, "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cyan2, "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cyan1, "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", s:green1, "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:green1, "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", s:red1, "", "")
call <sid>hi("sassClassChar",  s:gui09, "", s:red2, "", "")
call <sid>hi("sassInclude",    s:gui0E, "", s:purple1, "", "")
call <sid>hi("sassMixing",     s:gui0E, "", s:purple1, "", "")
call <sid>hi("sassMixinName",  s:gui0D, "", s:blue1, "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:gui01, s:green1, s:green2, "")
call <sid>hi("SignifySignChange",  s:gui0D, s:gui01, s:blue1, s:green2, "")
call <sid>hi("SignifySignDelete",  s:gui08, s:gui01, s:red1, s:green2, "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:gui00, "", s:black1, "undercurl")
call <sid>hi("SpellLocal",   "", s:gui00, "", s:black1, "undercurl")
call <sid>hi("SpellCap",     "", s:gui00, "", s:black1, "undercurl")
call <sid>hi("SpellRare",    "", s:gui00, "", s:black1, "undercurl")

" Remove functions
delf <sid>hi
delf <sid>gui
delf <sid>cterm

" Status line - changes colors depending on insert mode


" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:black1 s:green2 s:yellow2 s:black2 s:blue2 s:white1 s:purple2 s:white2 s:red1 s:red2 s:yellow1 s:green1 s:cyan1 s:blue1 s:purple1 s:cyan2
