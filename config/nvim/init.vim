" ------------------------------------------------- "
" Neovim config
" @author Harmen Janssen
" @link https://github.com/harmenjanssen/dotfiles
"
" Table of contents:
"
" 1.  Plugins
" 2.  Basics
" 3.  Mappings
" 4.  Tabs, buffers, windows
" 5.  Finding and searching. Searching and finding.
" 6.  Editor look and feel
" 7.  Abbreviations (or: Common typos)
" 8.  Formatting
" 9.  Misc
" 10. Plugin configuration
" ------------------------------------------------- "

set nocompatible
filetype plugin indent on

" ------------------------------------------------- "
" Plugins
" ------------------------------------------------- "
source ~/.config/nvim/plugins.vim

" ------------------------------------------------- "
" Basics
" ------------------------------------------------- "
set modelines=0
set hidden
set mouse=n
set ttyfast

" ------------------------------------------------- "
" Mappings
" ------------------------------------------------- "
let mapleader = ","

" Save some keystrokes; use ; instead of :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Quick access to init.vim.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Exit insert mode quicker.
inoremap jj <esc>

" Keep the cursor in place while joining lines.
nnoremap J mzJ`z

" Split lines.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Operator-pending mappings.
onoremap p i(
onoremap ' i'
onoremap " i"
onoremap { i{

" Fast saving.
nnoremap <leader>w :w!<cr>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ------------------------------------------------- "
" Tabs, buffers, windows
" ------------------------------------------------- "

" Easier moving in tabs and windows.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use BACKSPACE to toggle buffers
nnoremap <BS> <C-^>

" Resize splits when the window is resized
au VimResized * :wincmd =

" Only show cursorline in the current window and in normal mode.
augroup cline
	autocmd!
	autocmd WinLeave,InsertEnter * set nocursorline
	autocmd WinEnter,InsertLeave * set cursorline
augroup END

" ------------------------------------------------- "
" Finding and searching. Searching and finding.
" ------------------------------------------------- "
set path=.,**

" The Silver Searcher
if executable('ag')
	" Use ag over grep.
	set grepprg=ag\ --nogroup\ --nocolor
endif

" See https://thoughtbot.com/blog/faster-grepping-in-vim
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Turn off Vim's own regexp handling.
nnoremap / /\v
vnoremap / /\v

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Clear search highlight.
nnoremap <leader><space> :noh<cr>

" Search settings
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
" Enable /g flag by default
set gdefault

" I don't remember what this is for.
autocmd QuickFixCmdPost *grep* cwindow

" ------------------------------------------------- "
" Editor look and feel
" ------------------------------------------------- "
if (has("termguicolors"))
	set termguicolors
endif
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax on
colorscheme night-owl
" Override comment colors (otherwise a dark background is rendered instead of
" a dark foreground.
" See also: https://github.com/haishanh/night-owl.vim/issues/15
hi Comment guifg=#011627 guibg=#637777

set encoding=utf-8
set splitbelow
set splitright
" Allow backspacing over indent, eol, and the start of an insert.
set backspace=2

" Status line
set statusline=%f\ %y\ %m\ %r
set laststatus=2
set cmdheight=2
set showmode
set showcmd

set relativenumber
set number
set numberwidth=2
set scrolloff=3

" Don't redraw the screen when running macros.
set lazyredraw

" Hide the mouse while typing.
set mousehide

" ------------------------------------------------- "
" Abbreviations (or: Common typos)
" ------------------------------------------------- "
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

" ------------------------------------------------- "
" Formatting
" ------------------------------------------------- "

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

" Set shallow indentation for certain filetypes.
augroup indentation
    autocmd!
	autocmd FileType javascript,json,pug,yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
augroup END

" Set specific textwidth for certain filetypes.
augroup textwidth
	autocmd!
	autocmd FileType gitcommit setlocal textwidth=72
	autocmd FileType markdown,html.twig,json,csv setlocal textwidth=0
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

" Clear trailing whitespace upon save.
augroup whitespace
    autocmd!
    autocmd BufWritePre * :call StripTrailingWhitespace()
augroup END

" Teach vim some new extensions.
augroup custom_filetypes
	autocmd!
	autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
	autocmd BufRead,BufNewFile *.cap setlocal filetype=ruby
    autocmd BufRead,BufNewFile *.scss setlocal filetype=scss.css
	autocmd BufRead,BufNewFile *.es6 setlocal filetype=javascript
	autocmd BufRead,BufNewFile *.htm setlocal filetype=html.twig
augroup END

" ------------------------------------------------- "
" Misc
" ------------------------------------------------- "

augroup crontab
    autocmd!
    autocmd FileType crontab setlocal nobackup nowritebackup
augroup END

" Jump to definition using <Enter>.
augroup tag_navigation
	autocmd!
	autocmd BufRead,BufNewFile * if &l:modifiable | nnoremap <buffer> <CR> :exec("tag ".expand("<cword>"))<CR> | endif
augroup END

" Share the system clipboard.
set clipboard=unnamed

" Improve performance of listings by ignoring some files.
set wildignore+=*.o,*.obj,*.jpg,*.jpeg,*.png,*.gif,*.ser,.git,public/js/build/prod/*

" Persistent history.
set history=1000
if exists("&undodir")
	set undodir=/tmp
	if filewritable(&undodir) == 0 | call mkdir(&undodir, "p") | endif
	set undofile
endif

" Don't care for swap files.
set noswapfile

" Return to last edit position when opening files.
autocmd BufReadPost *
	\ if &ft != 'gitcommit' |
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \   endif |
    \ endif

" Auto-create folders when saving file in non-existent path.
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

" ------------------------------------------------- "
" Plugin configuration
" ------------------------------------------------- "

" vim-test
nnoremap <leader>te :call TestEdit()<cr>
nnoremap <leader>ts :TestSuite<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tn :TestNearest<cr>

let test#strategy = "vtr"
if (filereadable('docker-compose.yml'))
    let g:test#php#phpunit#executable = "docker-compose exec php ./vendor/bin/phpunit"
endif

" FZF
function! ListFiles()
    if filereadable('.git/config')
        :GFiles
    else
        :Files
    endif
endfunction

nnoremap <c-p> :call ListFiles()<cr>
nnoremap <leader>f :BTags<cr>
nnoremap <leader>t :Tags<cr>

" Gutentags
let g:gutentags_ctags_tagfile = ".git/tags"
let g:gutentags_ctags_extra_args = ["--tag-relative"]

" Prettier
autocmd BufWritePre *.js,*.jsx,*.php,*.scss,*.css exe "Prettier"

" Phpactor
nnoremap <Leader>u :call phpactor#UseAdd()<CR>
nnoremap <Leader>mm :call phpactor#ContextMenu()<CR>
