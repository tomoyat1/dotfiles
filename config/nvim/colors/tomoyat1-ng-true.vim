set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "tomoyat1 truecolors"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

hi Normal	guifg=White ctermfg=231 cterm=none

hi VertSplit	guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi Folded	guibg=#afd7ff guifg=#585858 ctermfg=153 ctermbg=240
hi FoldedColumn	guibg=#afd7ff guifg=#585858 ctermfg=153 ctermbg=240
hi IncSearch	guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi LineNr	guifg=#87afff ctermfg=111
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
hi CursorLineNr	guifg=#87d7ff ctermfg=117
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=#5f87d7 ctermfg=68
hi Question	guifg=springgreen
hi Search	guifg=#afd7ff guibg=#585858 ctermbg=153 ctermfg=240
hi SpecialKey	guifg=#5f87d7 ctermfg=68
hi StatusLine	guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi StatusLineNC	guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi Title	guifg=#87afff ctermfg=111
hi Visual	guibg=#4e4e4e ctermbg=239
"hi VisualNOS
hi WarningMsg	guifg=#800000 ctermfg=1
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

"diff
hi DiffAdd	guifg=#0c0d0e guibg=#88ff87
hi DiffChange	guifg=#0c0d0e guibg=#9e87ff
hi DiffDelete	guifg=#0c0d0e guibg=#ff5454 gui=none cterm=none

" syntax highlighting groups
hi Comment	guifg=#87afff
hi Constant	guifg=#ff8787
hi Identifier	guifg=#87f0ff gui=bold
hi Statement	guifg=#ffe287 gui=none cterm=none
hi PreProc	guifg=#9587ff
hi Type		guifg=#54ff54 gui=none
hi Special	guifg=#ff8787
"hi Underlined
hi Ignore	guifg=grey40
hi Error	guifg=#eeeeee guibg=#ff5454
hi ErrorMsg	guifg=#eeeeee guibg=#ff5454
hi Todo		guifg=#0c0d0e guibg=#ffd154

"deoplete colors"
hi Pmenu guifg=#00005f guibg=#87afff ctermfg=017 ctermbg=111
hi PmenuSel  guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi PmenuSbar  guifg=#00005f guibg=#87afff ctermfg=017 ctermbg=111
