" My Vimrc file

" Don't try to be Vi
set nocompatible

" Setup for Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Core Plugins
Plugin 'gmarik/Vundle.vim'

" Plugins Here
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'klen/python-mode'

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
