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
	Plugin 'godlygeek/tabular'
	Plugin 'airblade/vim-gitgutter'
    Plugin 'janko-m/vim-test'
    Plugin 'FooSoft/vim-argwrap'
    Plugin 'ludovicchabant/vim-gutentags'

    Plugin 'junegunn/fzf.vim'
    Plugin 'alok/notational-fzf-vim'
    Plugin 'junegunn/goyo.vim'

    " Colors
	Plugin 'lifepillar/vim-solarized8'
	Plugin 'morhetz/gruvbox'

	" Languages
    Plugin 'tobyS/vmustache'
    Bundle 'tobyS/pdv'
	Plugin 'othree/html5.vim'
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
    Bundle 'git://github.com/urso/haskell_syntax.vim.git'
    Plugin 'mustache/vim-mustache-handlebars'

    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
    Plugin 'Shougo/deoplete.nvim'

    Plugin 'phpactor/phpactor'
    Plugin 'kristijanhusak/deoplete-phpactor'

    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'christoomey/vim-tmux-runner'

	call vundle#end()

	filetype plugin indent on

" }}}}
" Basic options {{{{
	set modelines=0
	set hidden
	set mouse=n
	set ttyfast
    set complete=.,b,u,]

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
	" Use BACKSPACE to toggle buffers
	nnoremap <BS> <C-^>

    " List open buffers
    nnoremap § :ls<cr>:b

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
	" allow backspacing over indent, eol, and the start of an insert
	set backspace=2

	" status line
	" set statusline=%f\ %y\ %m\ %r\ Line:\ %l/%L\ Col:\ %c\ Buf:\ #%n
	set statusline=%f\ %y\ %m\ %r
	set laststatus=2
	set cmdheight=2
	set showmode
	set showcmd

    set relativenumber
    set number
    set numberwidth=2
	set scrolloff=3

    " don't redraw the screen when running macros
    set lazyredraw

	" hide the mouse while typing
	set mousehide

	set guicursor=n-v-c:block-Cursor-blinkon0
	set guicursor+=ve:ver35-Cursor
	set guicursor+=o:hor50-Cursor
	set guicursor+=i-ci:ver25-Cursor
	set guicursor+=r-cr:hor20-Cursor
	set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

	set guioptions=Ac
    set termguicolors

	" invisibles
	set listchars=tab:·\ ,eol:¬
	set nolist

	function! PinkCursor()
		" custom cursor color. Hot pink!
		highlight Cursor guifg=white guibg=#d13a82
	endfunction

	function! Dark()
		set background=dark
        call PinkCursor()
        silent !tmux source-file ~/.tmux-themes/dark.conf
	endfunction

	function! Light()
		set background=light
        call PinkCursor()
        silent !tmux source-file ~/.tmux-themes/light.conf
	endfunction

    function! Chomp(string)
        return substitute(a:string, '\n\+$', '', '')
    endfunction

    let g:solarized_termcolors=256
    colorscheme solarized8

    let tmuxtheme = split(Chomp(system('tmux show-environment -g TMUX_THEME')), "=")[1]
    if tmuxtheme == "dark"
        set background=dark
    else
        set background=light
    end

	if has("gui_running")
		set guifont=Fira\ Code:h13
        set macligatures
		set linespace=5
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
    set colorcolumn=+0
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

    autocmd QuickFixCmdPost *grep* cwindow

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

    function! GoyoOpen()
        if !exists('t:goyo_master')
            execute 'Goyo'
        endif
    endfunction

    " Notational FZF
    nnoremap <C-n> :call GoyoOpen()<cr>:NV<cr>
    let g:nv_preview_direction = 'right'
    let g:nv_create_note_window = 'edit'
    let g:nv_search_paths = ['~/Dropbox/notational-velocity']
    let g:nv_use_short_pathnames = 1

    " Test
    function! TestEdit()
        execute ":e tests/" . expand('%:r') . "Test." . expand('%:e')
    endfunction

    nnoremap <leader>te :call TestEdit()<cr>
    nnoremap <leader>ts :TestSuite<cr>
    nnoremap <leader>tl :TestLast<cr>
    nnoremap <leader>tf :TestFile<cr>
    nnoremap <leader>tn :TestNearest<cr>

    " FZF
    function! ListFiles()
        if filereadable('.git/config')
            :GFiles
        else
            :Files
        endif
    endfunction

    "let g:fzf_files_options = '--preview "head -'.&lines.' {}"'
    set rtp+=/usr/local/opt/fzf
    nnoremap <c-p> :call ListFiles()<cr>
    nnoremap <leader>f :BTags<cr>

    " Note: this should probably be conditionally set or whatever.
    " Not sure how yet.
    "let test#javascript#mocha#options = '--compilers js:babel-core/register'

    let test#strategy = "vtr"
    if (filereadable('docker-compose.yml'))
        let g:test#php#phpunit#executable = "docker exec -it (basename $PWD)_php_1 ./vendor/bin/phpunit"
    endif

	" CtrlP
	" leader key + j to open CtrlP in buffer mode
	"noremap <silent> <leader>j :CtrlPBuffer<CR>
	"let g:ctrlp_map = '<c-p>'

    "let g:ctrlp_user_command = 'ag %s -f -l --nocolor -g "" -U --ignore-dir bower_components --ignore-dir node_modules --ignore-dir clean_slate'
      "" ag is fast enough that CtrlP doesn't need to cache
	"let g:ctrlp_use_caching = 0
	"let g:ctrlp_cmd = 'CtrlP'
	"let g:ctrlp_working_path_mode = ''
	"let g:ctrlp_max_files = 0
	"let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|clean_slate'
    ""let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
    "let g:ctrlp_match_func = {'match' : 'pymatcher#PyMatch' }

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

    " Disable UltiSnips AutoTrigger to gain perf
    " see https://github.com/SirVer/ultisnips/issues/593
    augroup ultisnips_no_auto_expansion
        au!
        au VimEnter * au! UltiSnips_AutoTrigger
    augroup END

	" Supertab
	 "let g:SuperTabDefaultCompletionType = "context"
	" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

    " GitGutter
    "let g:gitgutter_signs = 0
    "let g:gitgutter_highlight_lines = 1

	" Bbye
	nnoremap <leader>bd :Bdelete<cr>

	" Tagbar
	"nnoremap <leader>f :TagbarToggle<cr>:setlocal relativenumber<cr>
	"let g:tagbar_autoclose = 1
	"let g:tagbar_autofocus = 1

    " Markdown
    let g:vim_markdown_folding_disabled = 1

    " Gutentags
    let g:gutentags_ctags_tagfile = ".git/tags"
    let g:gutentags_ctags_extra_args = ["--tag-relative"]

    " Argwrap
    nnoremap <silent> <leader>a :ArgWrap<CR>

    " PDV (PHP Documentor for Vim)
    let g:pdv_template_dir = $HOME ."/.vim/ultisnips/pdv/"
    nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

    " PHPActor
    autocmd FileType php setlocal omnifunc=phpactor#Complete

    nnoremap <Leader>u :call phpactor#UseAdd()<CR>
    nnoremap <Leader>mm :call phpactor#ContextMenu()<CR>

" }}}}
