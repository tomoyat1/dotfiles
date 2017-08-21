set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "tomoyat1"

hi Normal	guifg=White ctermfg=231

hi VertSplit	guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi Folded	guibg=#afd7ff guifg=#585858 ctermfg=153 ctermbg=240
hi FoldedColumn	guibg=#afd7ff guifg=#585858 ctermfg=153 ctermbg=240
hi IncSearch	guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi LineNr	guifg=#87afff ctermfg=111
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

" syntax highlighting groups
hi Comment	guifg=#87afff ctermfg=111
hi Constant	guifg=#d75f5f ctermfg=167
hi Identifier	guifg=#5fffff ctermfg=87
hi Statement	guifg=#d7d75f ctermfg=185
hi PreProc	guifg=#875fff ctermfg=99
hi Type		guifg=#8700ff ctermfg=77
hi Special	guifg=navajowhite
"hi Underlined
hi Ignore	guifg=grey40
hi Error	guifg=#e4e4e4 guibg=#870000 ctermfg=254 ctermbg=88
hi ErrorMsg	guifg=#e4e4e4 guibg=#870000 ctermfg=254 ctermbg=88
hi Todo		guifg=#1c1c1c guibg=#878700 ctermfg=234 ctermbg=100

"neocomplete colors"
hi Pmenu guifg=#00005f guibg=#87afff ctermfg=017 ctermbg=111
hi PmenuSel  guifg=#87afff guibg=#00005f ctermfg=111 ctermbg=017
hi PmenuSbar  guifg=#00005f guibg=#87afff ctermfg=017 ctermbg=111
