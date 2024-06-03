set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "tomoyat1 truecolors purple"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

hi Normal	guifg=#eeeeee guibg=#35332b

hi VertSplit	guifg=#71677c guibg=#35332b
hi Folded	guifg=#7681b0 guibg=#35332b gui=reverse
hi FoldColumn	guifg=#7681b0 guibg=#35332b gui=reverse
hi IncSearch	guifg=#76b0b0 guibg=#524D42
hi LineNr	guifg=#c895e6
hi clear CursorLine
hi CursorLine	guibg=#302F27 cterm=underline
hi CursorLineNr	guifg=#c895e6
hi ModeMsg	guifg=#eeeeee
hi MoreMsg	guifg=#eeeeee
hi NonText	guifg=#7681b0 gui=none
hi Question	guifg=#95e695 gui=bold
hi Search	guifg=#76b0b0 guibg=#524D42
hi SpecialKey	guifg=#7681b0
hi StatusLine	guifg=#71677c guibg=#35332b gui=reverse,bold
hi StatusLineNC	guifg=#71677c guibg=#35332b gui=reverse
hi Title	guifg=#95a2e6 gui=none
hi Visual	guibg=#4e4e4e
"hi VisualNOS
hi WarningMsg	guifg=#800000 guibg=#eeeeee gui=reverse
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

hi Directory	guifg=#95e6e6 guibg=#35332b

"diff
hi DiffAdd	guibg=#302f27 guifg=#95e695 gui=reverse
hi DiffChange	guibg=#302f27 guifg=#c895e6 gui=reverse
hi DiffDelete	guibg=#302f27 guifg=#e69595 gui=reverse
hi DiffText	guifg=Red guibg=white gui=bold,reverse

" syntax highlighting groups
hi Comment	guifg=#95a2e6 gui=bold
hi Constant	guifg=#e69595
hi Identifier	guifg=#95e6e6 gui=bold
hi Statement	guifg=#e6d195 gui=none cterm=none
hi PreProc	guifg=#c895e6
hi Type		guifg=#71af71 gui=none
hi Special	guifg=#e69595
"hi Underlined
hi Ignore	guifg=grey40
hi Error	guibg=#302f27 guifg=#e69595 gui=reverse
hi ErrorMsg	guibg=#302f27 guifg=#e69595 gui=reverse
hi Todo		guibg=#0c0d0e guifg=#e6d195 gui=reverse

"deoplete colors"
hi Pmenu	guifg=#eeeeee guibg=#302f27
hi PmenuSel	guibg=#95a2e6 guifg=#302f27
hi PmenuThumb	guifg=#95a2e6 guibg=#95a2e6
hi PmenuSbar	guifg=#eeeeee guibg=#302f27
