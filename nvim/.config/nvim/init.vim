" Plugin management
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif

    call plug#begin('~/.config/nvim/plugged')
        Plug 'morhetz/gruvbox'
        Plug 'neomutt/neomutt.vim'
        Plug 'preservim/nerdtree'
        Plug 'vim-scripts/loremipsum'
        Plug 'hallzy/gravity.vim'
        Plug 'Nopik/vim-nerdtree-direnter/'
        "Plug 'davidhalter/jedi-vim'
    call plug#end()

" Set theme
    autocmd VimEnter * ++nested colorscheme gruvbox

" Statusline
    "set statusline=%f
    "set statusline+=\ -\ %y
    "set statusline+=%=
    "set statusline+=%l/%L
    "set statusline+=\ 


" Default map leader
    let mapleader = "-"

" Misc settings
    set tabstop=4
    set shiftwidth=4
    set numberwidth=4
    set expandtab
    set number
    set relativenumber
    set hlsearch
    set nowrap

" Enable mouse scrolling
    set mouse=a

" Move lines
    nnoremap <c-j> :move +1<CR>
    nnoremap <c-k> :move -2<CR>

" Delete line
    inoremap <c-d> <esc>ddi
    nnoremap <c-d> dd

" Duplicate line
    inoremap <c-e> <esc>yypi
    nnoremap <c-e> yyp 

" Tabbing through tabs
    nnoremap <C-o> gt<CR>
    nnoremap <C-i> gT<CR>

" Basic autocomplete
    inoremap <C-Space> <C-n>

" Relative number toggling
    nnoremap <leader>r :set relativenumber!<CR>

" NERDTree settings
    nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <leader>1 1gt
    nnoremap <leader>2 2gt
    nnoremap <leader>3 3gt
    nnoremap <leader>4 4gt
    nnoremap <leader>5 5gt
    nnoremap <leader>6 6gt
    nnoremap <leader>7 7gt
    nnoremap <leader>8 8gt
    nnoremap <leader>9 9gt
    nnoremap <C-n> :NERDTreeToggle<CR>
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    let NERDTreeMapOpenInTab='<ENTER>'

" Autoreload sxhkd
    autocmd BufWritePost */sxhkdrc !pkill -USR1 -x sxhkd

" autogenerate main latex document (texlive-most needed)
    autocmd BufWritePost *.tex !pdflatex -shell-escape document.tex

" autogenerate groff ms documents
    autocmd BufWritePost *.ms !groff -Kutf8 -Tpdf -ms % > %:r.pdf

" Python: no docstring window on autocomplete
    autocmd FileType python setlocal completeopt-=preview
