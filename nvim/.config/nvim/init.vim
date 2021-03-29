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
        Plug 'davidhalter/jedi-vim'
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

" Tabbing through buffers
    nnoremap <C-o> :bn<CR>
    nnoremap <C-i> :bp<CR>

" NERDTree settings
    nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTreeToggle<CR>
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Autoreload sxhkd
    autocmd BufWritePost */sxhkdrc !pkill -USR1 -x sxhkd

" autogenerate main latex document (texlive-most needed)
    autocmd BufWritePost *.tex !latexmk -pdf document.tex

" autogenerate groff ms documents
    autocmd BufWritePost *.ms !groff -Kutf8 -Tpdf -ms % > %:r.pdf

" Python: no docstring window on autocomplete
    autocmd FileType python setlocal completeopt-=preview
