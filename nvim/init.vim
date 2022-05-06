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
set expandtab

augroup SomeName
		autocmd!
		autocmd FileType markdown set wrap
augroup END

""" Vim-Plug
call plug#begin()

" Aesthetics/Themes
Plug 'vim-airline/vim-airline'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' } 
" Plug 'whatyouhide/vim-gotham'
Plug 'chrisbra/Colorizer'

" Functional
Plug 'sheerun/vim-polyglot'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'junegunn/goyo.vim'
#Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" Colorscheme/Theme
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme spaceduck
" Highlight the 81th column (only non-space) as a warning
highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%81v\s*\zs\S', 100)

let mapleader = "\<Space>"

let g:mkdp_markdown_css = '/home/matt/Notes/.css/base.css'
let g:mkdp_page_title = 'Preview - ${name}'
noremap <M-m> :MarkdownPreview<CR>

inoremap <M-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nn <F7> :setlocal spell! spell?<CR>

""" Mappings for notes
let g:notes = "/home/matt/Notes/"
if executable('rg')
    set grepprg=rg\ --color=never\ --vimgrep
endif

command! -nargs=1 Ngrep grep "<args>" -g "*.md" ~/Notes
nnoremap <leader>ng :Ngrep

command! Vlist botright vertical copen | vertical resize 20
nnoremap <leader>v :Vlist<CR>

nnoremap <leader>nt :!ctags -R . <CR>
" Go to notes' index
nnoremap <leader>ni :e ~/Notes/index.md<CR>:cd ~/Notes<CR>
" Create new note, <space>nn filename
command! -nargs=1 NewNote :execute ":e" notes . strftime("%m%d%y") . "-<args>.md"
nnoremap <leader>nn :NewNote

function! HandleFZF(file)
    let filename = fnameescape(a:file)
    let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
    put=mdlink
endfunction

command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)
nnoremap <leader>nl ::call fzf#run({'sink': 'HandleFZF'})
