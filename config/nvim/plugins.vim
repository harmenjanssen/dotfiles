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
Plug 'scrooloose/nerdcommenter'

" Colors.
Plug 'haishanh/night-owl.vim'
Plug 'harmenjanssen/light-owl.vim'

" Running tests.
Plug 'janko-m/vim-test'

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

" Requirements of NCM2 and Phpactor:
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'

" Language support
Plug 'evidens/vim-twig'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

"
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

