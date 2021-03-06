""" Simple, but becoming complex config

set nocompatible
syntax on
set hidden
set autoindent
set number
set ignorecase
set showmatch
set ttyfast
set hlsearch
set ruler
set showcmd

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set copyindent
set smarttab
set bs=indent,eol,start

augroup SomeName
		autocmd!
		autocmd FileType markdown set wrap
augroup END

autocmd BufRead,BufNewFile *.md setlocal spell

""" Vim-Plug
" Auto Install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug-vim
    autocmd VimEnter * PlugInstall --sync
endif

call plug#begin()

" Aesthetics/Themes
Plug 'vim-airline/vim-airline'
Plug 'whatyouhide/vim-gotham'

" Functional
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'vivien/vim-linux-coding-style' " Adds 80 character per line highlighting

call plug#end()

" Colorscheme/Theme
set termguicolors

colorscheme gotham

let mapleader = ","
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_json = 1

let g:mkdp_auto_close = 0
noremap <M-m> :MarkdownPreview<CR>

nn <F7> :setlocal spell! spell?<CR>
