" ------------------------------------------------- "
" Plugin settings
" Moved to separate file to be able to start vim with -u plugins.vim, just to
" initialize vim-plug.
" ------------------------------------------------- "
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'

Plug 'airblade/vim-gitgutter'

" Finding and searching.
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code formatting.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Colors.
Plug 'haishanh/night-owl.vim'

" Running tests.
Plug 'janko-m/vim-test'

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Initialize plugin system
call plug#end()

