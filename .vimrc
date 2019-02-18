set background=dark
colorscheme solarized
set relativenumber
set number
set t_Co=256
"set term=xterm-256color
" ale hints
let g:ale_completion_enabled = 1
" Indent Settings
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:go_version_warning = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=56
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=57
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=4
set updatetime=100
let g:gitgutter_grep=''
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_signs = 1
let g:gitgutter_async = 0
let s:grep_available = 0
let g:gitgutter_realtime = 1
au FocusLost * nested silent! wall

silent !mkdir /home/developer/workspace/.vim/directory/ > /dev/null 2>&1
set directory=/home/developer/workspace/.vim/directory/
silent !mkdir /home/developer/workspace/.vim/backupdir/ > /dev/null 2>&1
set backupdir=/home/developer/workspace/.vim/backupdir/
silent !mkdir /home/developer/workspace/.vim/undodir/ > /dev/null 2>&1
set undodir=/home/developer/workspace/.vim/undodir/
set undofile

autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

set cursorcolumn
set cursorline

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap ]s <Plug>GitGutterStageHunk
nmap ]u <Plug>GitGutterUndoHunk


let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1
let g:better_whitespace_skip_empty_lines=1
set listchars=tab:→\ ,space:␣,nbsp:␣,trail:•,precedes:«,extends:»
"set listchars=tab:→\ ,space:␣,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
nnoremap <F3> :set list!<CR>

let NERDTreeShowHidden=1
let g:ctrlp_show_hidden = 1
nnoremap <Space>s/ :FlyGrep<cr>

if v:version < 700 || exists('loaded_switchcolor') || &cp
	finish
endif

let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)

	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute "colorscheme " . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif

	else
		let s:swback = 1
		if (&background == "light")
			execute "set background=dark"
		else
			execute "set background=light"
		endif

		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif

	" show current name on screen. :h :echo-redraw
	redraw
	execute "colorscheme"
endfunction

 map <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>

 map <S-F8>      :call SwitchColor(-1)<CR>
imap <S-F8> <Esc>:call SwitchColor(-1)<CR>
