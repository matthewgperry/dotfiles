""" Simple, but becoming complex config

set nocompatible
syntax on
set hidden
set autoindent
set number relativenumber
set ignorecase
set showmatch
set ttyfast
set hlsearch
set ruler
set showcmd

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

augroup SomeName
		autocmd!
		autocmd FileType markdown set wrap
augroup END

autocmd BufRead,BufNewFile *.md setlocal spell

""" Vim-Plug
call plug#begin()

" Aesthetics/Themes
Plug 'vim-airline/vim-airline'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' } 
" Plug 'whatyouhide/vim-gotham'
Plug 'chrisbra/Colorizer'

" Functional
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'vivien/vim-linux-coding-style' " Adds 80 character per line highlighting

call plug#end()

" Colorscheme/Theme"
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme spaceduck

let mapleader = ","
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_json = 1

let g:mkdp_auto_close = 0
noremap <M-m> :MarkdownPreview<CR>

nn <F7> :setlocal spell! spell?<CR>
