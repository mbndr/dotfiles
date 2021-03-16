
" auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

" Misc settings
set tabstop=4
set shiftwidth=4
set numberwidth=4
set number
set relativenumber

" Key mappings
" move lines
nnoremap <c-j> :move +1<CR>
nnoremap <c-k> :move -2<CR>
" delete line
inoremap <c-d> <esc>ddi
nnoremap <c-d> dd
" duplicate line
inoremap <c-e> <esc>yypi
nnoremap <c-e> yyp 


" set theme
autocmd VimEnter * ++nested colorscheme gruvbox

" reminder message
autocmd BufWritePost */config.h echom "Don't forget to make and restart!"

function ReloadSxhkd()
	echom "sxhkd reloaded"
	!pkill -USR1 -x sxhkd
endfunction

autocmd BufWritePost */sxhkdrc call ReloadSxhkd()

" this lets vim freeze sometimes...
"autocmd BufWritePost */init.vim :source $MYVIMRC
