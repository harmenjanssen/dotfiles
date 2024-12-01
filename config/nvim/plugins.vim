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
Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

" Finding and searching.
"Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colorschemes.
Plug 'haishanh/night-owl.vim'
Plug 'harmenjanssen/light-owl.vim'
Plug 'overcache/NeoSolarized'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'

" Running tests.
Plug 'janko-m/vim-test'

" Tmux helpers
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Autocompletion and Intellisense.
" Open COC config file using :CocConfig.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-diagnostic',
  \ 'coc-eslint'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
endif

" Language support
Plug 'evidens/vim-twig'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'hashivim/vim-terraform'

"
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

