" VIMRC
" @author Harmen Janssen
" @link https://github.com/harmenjanssen/dotfiles
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

	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-repeat'
	Plugin 'tpope/vim-abolish'
	Plugin 'tpope/vim-unimpaired'
	Plugin 'SirVer/ultisnips'
	Bundle 'rking/ag.vim'
	Plugin 'moll/vim-bbye'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'ervandew/supertab'
	Plugin 'godlygeek/tabular'
	Plugin 'majutsushi/tagbar'
	Plugin 'airblade/vim-gitgutter'
    Plugin 'neomake/neomake'
    Plugin 'janko-m/vim-test'
    Plugin 'FooSoft/vim-argwrap'

	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'FelikZ/ctrlp-py-matcher'

    " Colors
	Plugin 'altercation/vim-colors-solarized'
    Plugin 'thiagoalessio/rainbow_levels.vim'

	" Languages
    Plugin 'tobyS/vmustache'
    Bundle 'tobyS/pdv'
	Plugin 'othree/html5.vim'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'digitaltoad/vim-pug'
	Plugin 'evidens/vim-twig'
    Bundle 'dag/vim-fish'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'guns/vim-clojure-static'
    Plugin 'tpope/vim-fireplace'
    Plugin 'cakebaker/scss-syntax.vim'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'StanAngeloff/php.vim'
    Plugin 'purescript-contrib/purescript-vim'

    Plugin 'shawncplus/phpcomplete.vim'
    Plugin 'adoy/vim-php-refactoring-toolbox'

	call vundle#end()

	filetype plugin indent on

" }}}}
" Basic options {{{{
	set modelines=0
	set hidden
	set mouse=n
	set ttyfast

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
	"nnoremap j gj
	"nnoremap k gk

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

	" experimental and not yet production-ready: a function text-object
	vnoremap af <esc>?function<cr>vf{%
	vnoremap if <esc>?function<cr>f{vi{
	onoremap af :<c-u>execute "normal! ?function\r:nohlsearch\rvf{%"<cr>
	onoremap if :<c-u>execute "normal! ?function\r:nohlsearch\rf{vi{"<cr>

    set timeoutlen=1000
    set ttimeoutlen=0

    cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" }}}}
" Tabs, buffers, windows {{{{
	" easier moving in tabs and windows
	nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
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

	set relativenumber
	set number
	set numberwidth=2
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
		set background=dark
		"call PinkCursor()
	endfunction

	function! Light()
		set background=light
		"call PinkCursor()
	endfunction

    function! Chomp(string)
        return substitute(a:string, '\n\+$', '', '')
    endfunction

    colorscheme solarized
    let profile = Chomp(system('/Users/harmen/.config/fish/get_profile'))
    " Let current iTerm profile determine what background to use (unfortunately it's not possible to
    " read the current profile at runtime, only which profile the window started with. This is why I
    " use the somewhat less robust background color to guesstimate the profile.
    if profile == "533, 7720, 9941"
        set background=dark
    else
        set background=light
    end

	if has("gui_running")
		set guifont=Fira\ Code:h13
        set macligatures
		set linespace=5

		" use dark background after 20:00
        if strftime("%H") >= 8 && strftime("%H") <= 20
            call Light()
        else
            call Dark()
        endif
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
	set breakindent
	set fileformat=unix
	set textwidth=100
	set colorcolumn=+1
	set shiftwidth=4
	set tabstop=4
	set softtabstop=4
	set expandtab

	" Set indentation for js files
	augroup javascript
	    autocmd FileType javascript,json,pug setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
        "autocmd FileType javascript set formatprg=prettier\ --print-width\ 100\ --stdin
        "autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
    augroup END

	augroup textwidth
		autocmd!
		autocmd FileType gitcommit setlocal textwidth=72
		autocmd FileType markdown setlocal textwidth=0
		autocmd FileType html.twig setlocal textwidth=0
		autocmd FileType json setlocal textwidth=0
		autocmd BufRead *.phtml,*.html,*.csv setlocal textwidth=0
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
	  	autocmd BufRead,BufNewFile *.htm setlocal filetype=html.twig
	augroup END

" }}}}
" Search settings {{{{

	" Turn off Vim's own regexp handling
	nnoremap / /\v
	vnoremap / /\v

	" Keep search matches in the middle of the window
	"function! s:nice_next(cmd)
          "let view = winsaveview()
          "execute "normal! " . a:cmd
          "if view.topline != winsaveview().topline
            "normal! zz
          "endif
	"endfunction

	"nnoremap <silent> n :call <SID>nice_next('n')<cr>
	"nnoremap <silent> N :call <SID>nice_next('N')<cr>
    nnoremap n nzzzv
    nnoremap N Nzzzv

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
  		set grepprg=ag\ --nogroup\ --nocolor\ -U

	endif

	" bind K to grep word under cursor
	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" }}}}
" Misc {{{{

    augroup crontab
        autocmd!
        autocmd FileType crontab setlocal nobackup nowritebackup
    augroup END

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
	 \ if &ft != 'gitcommit' |
     \   if line("'\"") > 0 && line("'\"") <= line("$") |
     \     exe "normal! g`\"" |
     \   endif |
     \ endif

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

    " Inspired by https://gist.github.com/tpope/287147
    "augroup auto_alignment
        "autocmd!
        "" Automatically align PHP arrays when typing fat arrow in insert mode
        "autocmd FileType php inoremap <silent> => =><Esc>:call <SID>align()<CR>A
    "augroup END

    "function! s:align()
        "Tabularize /=>
    "endfunction

" }}}}
" Plugin configuration {{{{

	" NERDTree
	"nnoremap <leader>n :NERDTreeToggle<cr>
	"nnoremap <leader>c :NERDTreeFind<cr>

    " RainbowLevels
    let g:rainbow_levels = [
    \{'ctermfg': 2, 'guifg': '#859900'},
    \{'ctermfg': 6, 'guifg': '#2aa198'},
    \{'ctermfg': 4, 'guifg': '#268bd2'},
    \{'ctermfg': 5, 'guifg': '#6c71c4'},
    \{'ctermfg': 1, 'guifg': '#dc322f'},
    \{'ctermfg': 3, 'guifg': '#b58900'},
    \{'ctermfg': 8, 'guifg': '#839496'},
    \{'ctermfg': 7, 'guifg': '#586e75'}]

    " Test
    function! TestEdit()
        execute ":e tests/" . expand('%:r') . "Test." . expand('%:e')
    endfunction

    nnoremap <leader>te :call TestEdit()<cr>
    nnoremap <leader>ts :TestSuite<cr>
    nnoremap <leader>tl :TestLast<cr>
    nnoremap <leader>tf :TestFile<cr>
    nnoremap <leader>tn :TestNearest<cr>

    " Note: this should probably be conditionally set or whatever.
    " Not sure how yet.
    "let test#javascript#mocha#options = '--compilers js:babel-core/register'

    " TODO: figure out a way to make this conditional
    let g:test#php#phpunit#executable = "docker exec -it `basename $PWD`_web_1 phpunit"

	" CtrlP
	" leader key + j to open CtrlP in buffer mode
	noremap <silent> <leader>j :CtrlPBuffer<CR>
	let g:ctrlp_map = '<c-p>'

    let g:ctrlp_user_command = 'ag %s -f -l --nocolor -g "" -U --ignore-dir bower_components --ignore-dir node_modules --ignore-dir clean_slate'
  	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
	let g:ctrlp_cmd = 'CtrlP'
	let g:ctrlp_working_path_mode = ''
	let g:ctrlp_max_files = 0
	let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|clean_slate'
    "let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
    let g:ctrlp_match_func = {'match' : 'pymatcher#PyMatch' }

	" Tabularize
	" Mappings to common alignments
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
	nnoremap <leader>f :TagbarToggle<cr>:setlocal relativenumber<cr>
	let g:tagbar_autoclose = 1
	let g:tagbar_autofocus = 1

    " Markdown
    let g:vim_markdown_folding_disabled = 1

    " Neomake
    autocmd! BufWritePost * Neomake
    let g:neomake_php_phpcs_args_standard = "vendor/grrr-amsterdam/garp3/phpcs.xml"
    let g:neomake_php_phpmd_args = ['%:p', 'text', 'codesize,design,unusedcode,naming,cleancode']

    " Argwrap
    nnoremap <silent> <leader>a :ArgWrap<CR>

    " PDV (PHP Documentor for Vim)
    let g:pdv_template_dir = $HOME ."/.vim/ultisnips/pdv/"
    nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" }}}}
" Garp {{{{

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
