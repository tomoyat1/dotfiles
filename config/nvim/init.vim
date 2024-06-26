scriptencoding utf-8
set encoding=utf-8

let g:python3_host_prog = '/home/tomoyat1/.pyenv/versions/3.8.0/bin/python'

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:lazy_toml = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml)
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1 

let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

if executable('clang-3.6')
	let g:clang_exec = 'clang-3.6'
elseif executable('clang-3.5')
	let g:clang_exec = 'clang-3.5'
elseif executable('clang-3.4')
	let g:clang_exec = 'clang-3.4'
else
	let g:clang_exec = 'clang'
endif

if executable('clang-format-3.6')
	let g:clang_format_exec = 'clang-format-3.6'
elseif executable('clang-format-3.5')
	let g:clang_format_exec = 'clang-format-3.5'
elseif executable('clang-format-3.4')
	let g:clang_format_exec = 'clang-format-3.4'
else
	let g:clang_exec = 'clang-format'
endif

let g:deoplete#enable_at_startup = 1

filetype plugin indent on
syntax enable

set number
set wrap
syntax on
set ts=8 sw=8 sts=4
set smartindent
set nosmarttab
set selectmode=mouse
set incsearch ignorecase smartcase 
set foldmethod=syntax
set langmenu=en_US.UTF-8
set hlsearch
set list
set listchars=tab:▸\ ,eol:¬
set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set autoread
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Status line"
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

"Haskell"
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ 'haskell': ['hie', '--lsp'],
\ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

"OCaml"
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']
execute "set rtp+=" . g:opamshare . "/typerex/ocp-indent/vim"

"Denite"
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Denite file_rec<cr>
" reset not it is <C-l> normally
nnoremap <space>r <Plug>(denite_restart)

"Ag"
nmap * :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag 

"Highlight cursor line"
set cursorline

colorscheme tomoyat1-ng-true-purple

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
au OptionSet diff let &cul=!v:option_new " disable cursor line in diff
"Filetype specific tab settings"
autocmd Filetype cabal setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype elm setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype haskell setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype lisp setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype lua setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ocaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype proto setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scala setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype terraform setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab

"Disable scroll"
set mouse=

"Make backspace not delete newlines"
set backspace=indent,eol

source ~/.config/nvim/hilinks.vim
