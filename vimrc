" VIMRC
" @author Harmen Janssen
" @link https://github.com/harmenjanssen/vimrc
" ------------------------------------------------- "

if &shell =~# 'fish$'
	set shell=sh
endif

" Vundle setup {{{{
	set nocompatible
	filetype off

	set runtimepath+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'gmarik/Vundle.vim'

    "Plugin 'kana/vim-textobj-user'
    "Plugin 'whatyouhide/vim-textobj-xmlattr'

	Plugin 'tpope/vim-fugitive'
	Plugin 'SirVer/ultisnips'
	Bundle 'rking/ag.vim'
	Plugin 'moll/vim-bbye'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-repeat'
	Plugin 'ervandew/supertab'
	Plugin 'godlygeek/tabular'
	Plugin 'majutsushi/tagbar'
	Plugin 'tpope/vim-unimpaired'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'FelikZ/ctrlp-py-matcher'
	Plugin 'airblade/vim-gitgutter'

    " Colors
	Plugin 'chriskempson/base16-vim'
	Plugin 'altercation/vim-colors-solarized'

	" Languages
	Plugin 'othree/html5.vim'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'digitaltoad/vim-pug'
	Plugin 'evidens/vim-twig'
    Bundle 'dag/vim-fish'
	Plugin 'jelera/vim-javascript-syntax'
	Plugin 'pangloss/vim-javascript'
    Plugin 'guns/vim-clojure-static'
    Plugin 'tpope/vim-fireplace'

	Plugin 'tpope/vim-abolish'

    Plugin 'neomake/neomake'

	call vundle#end()

	filetype plugin indent on

" }}}}
" Basic options {{{{
	set modelines=0
	set hidden

" }}}}
" Mappings {{{{
	let mapleader = ","

	" Save some keystrokes; use ; instead of :
	nnoremap ; :
	nnoremap : ;
	vnoremap ; :
	vnoremap : ;

	" quick access to $MYVIMRC
	nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	nnoremap <leader>sv :source $MYVIMRC<cr>

	" open scratchpad
	noremap <leader><leader>s :split ~/Dropbox/scratchpad.md<cr>

	" exit insert mode quicker
	inoremap jj <esc>

	" Keep the cursor in place while joining lines
	nnoremap J mzJ`z

	" Split lines
	nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

	" yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" wrapped lines goes down/up to next row, rather than next line in file.
	nnoremap j gj
	nnoremap k gk

	" Better mappings to move to start/end of line
	noremap H ^
	noremap L $
	vnoremap L g_

	" operator-pending mappings
	onoremap p i(
	onoremap ' i'
	onoremap " i"
	onoremap { i{

	" jump to next equals sign. Apparently I change variable names a lot
	onoremap = f=

	" fast saving
	nnoremap <leader>w :w!<cr>

	" For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

	" Line completion
	inoremap <c-l> <c-x><c-l>

	" Delete into blackhole register to not fuck with the regular clipboard
	nnoremap <Leader>d "_d
	nnoremap <Leader>D "_D
	nnoremap <Leader>C "_C
	nnoremap <Leader>c "_c
	nnoremap <Leader>x "_x

	" experimental and not yet production-ready: a function text-object
	vnoremap af <esc>?function<cr>vf{%
	vnoremap if <esc>?function<cr>f{vi{
	onoremap af :<c-u>execute "normal! ?function\r:nohlsearch\rvf{%"<cr>
	onoremap if :<c-u>execute "normal! ?function\r:nohlsearch\rf{vi{"<cr>

" }}}}
" Tabs, buffers, windows {{{{
	" easier moving in tabs and windows
	noremap <c-j> <c-w>j<c-w>_
	noremap <c-k> <c-w>k<c-w>_
	noremap <c-l> <c-w>l<c-w>_
	noremap <c-h> <c-w>h<c-w>_
	" Use TAB to toggle buffers
	nnoremap <tab> :b#<cr>

	nnoremap <leader>x :Explore<cr>

	" Resize splits when the window is resized
	au VimResized * :wincmd =

	" Only show cursorline in the current window and in normal mode.
	augroup cline
    	au!
    	au WinLeave,InsertEnter * set nocursorline
    	au WinEnter,InsertLeave * set cursorline
	augroup END

" }}}}
" Abbreviations {{{{

	iabbrev adn and
	iabbrev htis this
	iabbrev endfi endif
	iabbrev enw new
	iabbrev idnex index
	cabbrev idnex index
	iabbrev ecoh echo
	iabbrev fasle false
	iabbrev hasOen hasOne
	iabbrev heigth height
	iabbrev hwere where
	iabbrev fucntion function
	iabbrev fcuntion function
	iabbrev calss class
	iabbrev reutrn return
	iabbrev neccessary necessary

" }}}}
" GUI settings {{{{

	syntax on
	set encoding=utf-8
	set splitbelow
	set splitright
	set visualbell
	" allow backspacing over indent, eol, and the start of an insert
	set backspace=2

	" status line
	set statusline=%f\ %y\ %m\ %r\ Line:\ %l/%L\ Col:\ %c\ Buf:\ #%n
	set laststatus=2
	set cmdheight=2
	set showmode
	set showcmd

	set number
	set scrolloff=3

	" hide the mouse while typing
	set mousehide

	set guicursor=n-v-c:block-Cursor-blinkon0
	set guicursor+=ve:ver35-Cursor
	set guicursor+=o:hor50-Cursor
	set guicursor+=i-ci:ver25-Cursor
	set guicursor+=r-cr:hor20-Cursor
	set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

	set guioptions=Ac

	" invisibles
	set listchars=tab:·\ ,eol:¬
	set nolist

	function! PinkCursor()
		" custom cursor color. Hot pink!
		highlight Cursor guifg=white guibg=#d13a82
	endfunction

	function! Dark()
		if has("gui_running")
			set background=dark
		endif

		call PinkCursor()
	endfunction

	function! Light()
		if has("gui_running")
			set background=light
		endif

		call PinkCursor()
	endfunction

    colorscheme solarized
    call Dark()

	if has("gui_running")
		"set guifont=CamingoCode:h13
		set guifont=Fira\ Code:h13
        set macligatures
		set linespace=5
		"set fullscreen

		" use dark background after 20:00
        if strftime("%H") >= 8 && strftime("%H") <= 20
            call Light()
        else
            call Dark()
        endif
		"call Dark()

	endif

	command! Dark call Dark()
	command! Light call Light()

" }}}}
" Formatting {{{{

	set wrap
	set showbreak=↪
	set linebreak
	set shiftround
	set autoindent
	set copyindent
	set preserveindent
	set smartindent
	set fileformat=unix
	set textwidth=100
	set colorcolumn=+1
	set shiftwidth=4
	set tabstop=4
	set softtabstop=4
	set expandtab

	" Set indentation for js files
	autocmd FileType javascript,json,pug setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

	augroup textwidth
		autocmd!
		autocmd FileType gitcommit setlocal textwidth=72
		autocmd BufRead *.phtml,*.html,*.csv,*.twig setlocal textwidth=0
	augroup END

	augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker
	augroup END

	function! StripTrailingWhitespace()
  		normal mZ
  		let l:chars = col("$")
  		let l:filetype = &filetype
  		if (l:filetype == 'markdown')
  		    return
  		endif
  		%s/\s\+$//e
  		if (line("'Z") != line(".")) || (l:chars != col("$"))
    		echo "Trailing whitespace stripped\n"
  		endif
  		normal `Z
	endfunction

	augroup whitespace
		autocmd BufWritePre * :call StripTrailingWhitespace()
	augroup END

	augroup custom_filetypes
		autocmd!
		autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
		autocmd BufRead,BufNewFile *.cap setlocal filetype=ruby
		autocmd BufRead,BufNewFile *.scss setlocal filetype=scss.css
	  	autocmd BufRead,BufNewFile *.es6 setlocal filetype=javascript
	augroup END

" }}}}
" Search settings {{{{

	" Turn off Vim's own regexp handling
	nnoremap / /\v
	vnoremap / /\v

	" Keep search matches in the middle of the window
	function! s:nice_next(cmd)
  		let view = winsaveview()
  		execute "normal! " . a:cmd
  		if view.topline != winsaveview().topline
    		normal! zz
  		endif
	endfunction

	nnoremap <silent> n :call <SID>nice_next('n')<cr>
	nnoremap <silent> N :call <SID>nice_next('N')<cr>
	"nnoremap n nzzzv
	"nnoremap N Nzzzv

	nnoremap <leader><space> :noh<cr>

	set hlsearch
	set incsearch
	set wrapscan
	set ignorecase
	set smartcase
	set gdefault " Enable /g flag by default

	" The Silver Searcher
	if executable('ag')
  		" Use ag over grep
  		set grepprg=ag\ --nogroup\ --nocolor

	endif

	" bind K to grep word under cursor
	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" }}}}
" Misc {{{{

	" Enter opens tag
	augroup tag_navigation
		autocmd!
		autocmd BufRead,BufNewFile * if &l:modifiable | nnoremap <buffer> <CR> :exec("tag ".expand("<cword>"))<CR> | endif
	augroup END

	" use the system clipboard
	set clipboard=unnamed

	" improve performance of listings by ignoring some files
	set wildignore+=*.o,*.obj,*.jpg,*.jpeg,*.png,*.gif,*.ser,.git,public/js/build/prod/*

	" persistent history
	set history=1000
	if exists("&undodir")
		set undodir=/tmp
		if filewritable(&undodir) == 0 | call mkdir(&undodir, "p") | endif
		set undofile
	endif

	" don't care for swap files
	set noswapfile

	" return to last edit position when opening files
	autocmd BufReadPost *
	 \ if &ft =~ 'gitcommit' |
     \   if line("'\"") > 0 && line("'\"") <= line("$") |
     \     exe "normal! g`\"" |
     \   endif |
     \ endif

	" This function finds the config.rb
	" file that's needed to compile by traversing up the tree.
	function! CompileSass()
		let cssDir = fnamemodify(bufname("%"), ":p:h")
		let threshold = 20
		let iterations = 0
		while !filereadable(cssDir . '/config.rb')
			let cssDir = cssDir . '/..'
			" Do not loop forever
			let iterations += 1
			if iterations >=# threshold
				return
			endif
		endwhile
		execute "!compass compile " . cssDir . " -e production --boring > /dev/null"
	endfunction

	"augroup compass_compile
		"autocmd!
		"autocmd BufWritePost *.scss :call CompileSass()
	"augroup END

	" Execute php code in current buffer
	function! ExecutePhp()
		let bufcontent = join(getline(1, line('$')), "")
		let code = substitute(bufcontent, '\v\<\?(php)?|\?\>', '', 'g')
        execute "!php -r " . shellescape(code)
	endfunction

	nnoremap <leader>p :call ExecutePhp()<cr>

	" Auto-create folders when saving file in non-existent path
	function! s:MkNonExDir(file, buf)
    	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        	let dir=fnamemodify(a:file, ':h')
        	if !isdirectory(dir)
            	call mkdir(dir, 'p')
        	endif
    	endif
	endfunction

	augroup BWCCreateDir
    	autocmd!
    	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
	augroup END

	" RenameFile taken from https://github.com/r00k/dotfiles/blob/master/vimrc
	function! RenameFile()
    	let old_name = expand('%')
    	let new_name = input('New file name: ', expand('%'), 'file')
    	if new_name != '' && new_name != old_name
        	exec ':saveas ' . new_name
        	exec ':silent !rm ' . old_name
        	redraw!
    	endif
	endfunction
	noremap <Leader>r :call RenameFile()<cr>

	function! PhpLibraryTemplate(path)
		let pos_from_lib=strridx(a:path, 'library') + strlen('library/')
		let pos_of_dot=strridx(a:path, '.')-1
		let path_from_lib=a:path[pos_from_lib : pos_of_dot]
		let classname=join(split(path_from_lib, '/'), '_')
		execute "normal! i<?php"
		execute "normal! Goclass ".classname." {"
		execute "normal! Go	"
		execute "normal! Go}"
		execute "normal! Gk"
	endfunction

	function! ModelConfigTemplate(path)
		execute "0read ".expand("$HOME/.vim/templates/model_config.json")
	endfunction

	augroup templates
		au!
		" read in templates files
		autocmd BufNewFile **/library/*.php :call PhpLibraryTemplate(expand('<afile>'))
		autocmd BufNewFile **/models/config/*.json :call ModelConfigTemplate(expand('<afile>'))
	augroup END

	function! EditZendView()
		" find first previous Action statement
		let linenumber=line('.')
		let match=0
		while linenumber > 0
			let line=getline(linenumber)
			let match=matchstr(line, '\v\zs([a-z]+)\zeAction')
			echom line
			echom match
			if !empty(match)
				break
			endif

			let linenumber -= 1
		endwhile

		if !empty(match)
			" :e views/scripts/<controller>/<action>.phtml
		else
			echo 'current action not found'
		end
	endfunction

" }}}}
" Plugin configuration {{{{

	" NERDTree
	nnoremap <leader>n :NERDTreeToggle<cr>
	nnoremap <leader>c :NERDTreeFind<cr>

	" CtrlP
	nnoremap <leader>t :CtrlP<cr>
	" leader key + j to open CtrlP in buffer mode
	noremap <silent> <leader>j :CtrlPBuffer<CR>
	let g:ctrlp_map = '<c-p>'

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -U --ignore-dir bower_components --ignore-dir node_modules'
  	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
	let g:ctrlp_cmd = 'CtrlP'
	let g:ctrlp_working_path_mode = ''
	let g:ctrlp_max_files = 0
	let g:ctrlp_custom_ignore = 'node_modules\|bower_components'
    "let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
    let g:ctrlp_match_func = {'match' : 'pymatcher#PyMatch' }

	" Syntastic
	" Use scss_lint for syntax checking
	let g:syntastic_scss_checkers = ['scss_lint']
	let g:syntastic_php_checkers = ['php']

	" Ignore unrecognized html tags
	let g:syntastic_html_tidy_ignore_errors = ['Unnecessary parent selector', 'proprietary attribute', 'missing </a>', 'trimming empty', 'is not recognized', 'discarding unexpected'  ]
	let g:syntastic_php_ignore_errors = ['Line indented incorrectly']

	" Tabularize
	" mappings to common alignments
	nnoremap <leader>a= :Tabularize /=<cr>
	vnoremap <leader>a= :Tabularize /=<cr>
	nnoremap <leader>a: :Tabularize /:\zs<cr>
	vnoremap <leader>a: :Tabularize /:\zs<cr>
	nnoremap <leader>a> :Tabularize /=><cr>
	vnoremap <leader>a> :Tabularize /=><cr>

	" UltiSnips
	let g:UltiSnipsSnippetDirectories=["ultisnips"]
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

	" Supertab
	 "let g:SuperTabDefaultCompletionType = "context"
	" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

	" Bbye
	nnoremap <leader>bd :Bdelete<cr>

	" Tagbar
	nnoremap <leader>f :TagbarToggle<cr>
	let g:tagbar_autoclose = 1
	let g:tagbar_autofocus = 1

    " Markdown
    let g:vim_markdown_folding_disabled = 1

    " Neomake
    autocmd! BufWritePost * Neomake
    let g:neomake_php_phpcs_args_standard = "vendor/grrr-amsterdam/garp3/phpcs.xml"
" }}}}
" Garp {{{{
	" Auto-clear cache after editing .ini files
	"augroup garpini
		"autocmd!
		"autocmd BufWritePost *.ini !php garp/scripts/garp.php Cache clear --e=development
	"augroup END

	" Create snippets from selected text
	function! s:get_visual_selection()
  		" Why is this not a built-in Vim script function?!
  		let [lnum1, col1] = getpos("'<")[1:2]
  		let [lnum2, col2] = getpos("'>")[1:2]
  		let lines = getline(lnum1, lnum2)
  		let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  		let lines[0] = lines[0][col1 - 1:]
  		return join(lines, "\n")
	endfunction

	function! CreateSnippet()
		let txt = s:get_visual_selection()
		let snippetId = substitute(txt, " ", "_", "g")
		let defaultTxt = input("What's the default text? ")
		if strlen(defaultTxt) == 0
			return
		endif
		let defaultLocale = input("What's the default locale? (nl) ")
		if strlen(defaultLocale) == 0
			let defaultLocale = "nl"
		endif
		if strlen(txt) == 0
			echom "No text selected"
			return
		endif
		execute ":write"
		execute ":edit application/configs/snippets.ini"
		execute "/\\\v\\\[staging\\\ :\\\ production\\\]"
		execute "normal! Osnippets." . snippetId . ".has_text = 1"
		execute "normal! osnippets." . snippetId . ".text." . defaultLocale . " = \"" . defaultTxt . "\""
		execute "normal! o"
		execute ":nohl"
		execute ":write"
		execute ":b#"
	endfunction

	vnoremap <C-s> :call CreateSnippet()<cr>

" }}}}
" Local overriding {{{
	if filereadable(expand("~/.vimrc.local"))
    	source ~/.vimrc.local
	endif
" }}}}
