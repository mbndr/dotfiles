call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

call plug#end()

" Enable syntax highlighting
syntax on

" Show line numbers
set number

" Set colorscheme
colorscheme gruvbox
autocmd BufEnter *.asm colorscheme default

" Statusbar
set laststatus=2

" Better tabstop
set tabstop=4

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }