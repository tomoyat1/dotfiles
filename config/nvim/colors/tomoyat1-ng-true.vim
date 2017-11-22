set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "tomoyat1 truecolors"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

hi Normal	guifg=#eeeeee guibg=#393940

hi VertSplit	guifg=#87afff guibg=#00005f
hi Folded	guifg=#afd7ff guibg=#585858 gui=reverse
hi FoldColumn	guifg=#afd7ff guibg=#585858 gui=reverse
hi IncSearch	guifg=#87afff guibg=#00005f
hi LineNr	guifg=#87afff
hi clear CursorLine
hi CursorLine	guibg=#303036 cterm=underline
hi CursorLineNr	guifg=#87d7ff
hi ModeMsg	guifg=#eeeeee
hi MoreMsg	guifg=#eeeeee
hi NonText	guifg=#5f87d7 ctermfg=68 gui=none
hi Question	guifg=#54ff54 gui=bold
hi Search	guifg=#afd7ff guibg=#585858
hi SpecialKey	guifg=#5f87d7 ctermfg=68
hi StatusLine	guifg=#87afff guibg=#00005f
hi StatusLineNC	guifg=#87afff guibg=#00005f
hi Title	guifg=#87afff ctermfg=111 gui=none
hi Visual	guibg=#4e4e4e ctermbg=239
"hi VisualNOS
hi WarningMsg	guifg=#800000 guibg=#eeeeee gui=reverse
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

"diff
hi DiffAdd	guibg=#0c0d0e guifg=#88ff87 gui=reverse
hi DiffChange	guibg=#0c0d0e guifg=#9e87ff gui=reverse
hi DiffDelete	guibg=#0c0d0e guifg=#ff5454 gui=reverse
hi DiffText	guifg=Red guibg=white gui=bold,reverse

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
hi Error	guibg=#eeeeee guifg=#ff5454 gui=reverse
hi ErrorMsg	guibg=#eeeeee guifg=#ff5454 gui=reverse
hi Todo		guibg=#0c0d0e guifg=#ffd154 gui=reverse

"deoplete colors"
hi Pmenu	guifg=#eeeeee guibg=#303036
hi PmenuSel	guibg=#87afff guifg=#00005f
hi PmenuThumb	guifg=#87afff guibg=#87afff
hi PmenuSbar	guifg=#eeeeee guibg=#303036
