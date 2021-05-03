" My Vimrc file

" Don't try to be Vi
set nocompatible

" Setup for Vundle
filetype off
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Plugins Here
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

" Stop managing plugins
call vundle#end()

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
