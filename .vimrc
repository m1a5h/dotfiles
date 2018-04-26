set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Core Bundle
Bundle 'gmarik/Vundle.vim'

" Your Bundles Here
Bundle 'altercation/vim-colors-solarized'
Bundle 'ctrlpvim/ctrlp.vim'

" Settings
filetype plugin indent on
set number relativenumber	
syntax enable
set background=dark
" let g:solarized_termcolors = 256
colorscheme delek
highlight Comment cterm=bold

" use ctags with vim
nnoremap <silent> <Leader> :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" use 'jk' for Escape
inoremap jk <Esc>
