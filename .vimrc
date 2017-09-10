" My vim configuration file

" turn off vi compatibility
set nocompatible

" don't specify filetypes for the Vundle bit
filetype off

" NetRW settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 15
augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * :Vexplore
augroup END
au VimEnter * wincmd l

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" could pass another path to install plugins - best not to though
" call vundle#begin('~/some/other/path') " alternative path

" let Vundle mamage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" remove distraction from writing
Plugin 'junegunn/goyo.vim'

" use vim and pandoc
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" help with JavaScript syntax
Plugin 'jelera/vim-javascript-syntax'

" more useful hightlighting and intendation
Plugin 'pangloss/vim-javascript'

" more indentation help
Plugin 'nathanaelkane/vim-indent-guides'

" auto close brackets, quotes etc
Plugin 'Raimondi/delimitMate'

" autocomplete things well
Plugin 'Valloric/YouCompleteMe'

" parsing JavaScript
Plugin 'marijnh/tern_for_vim'

" all plugins must be added before this line
call vundle#end()
filetype plugin indent on " can specify filetypes again

" syntax highlighting
syntax on

" set colouring properly
set t_Co=256
set background=dark
colorscheme elflord

" use "jj" or "kk" rather than "Esc"
inoremap jj <Esc>
inoremap kk <Esc>

" make positon (line, column) visible at bottom and side
set ruler
set number relativenumber

" make all types of tabs 4 spaces
set sts=4
set ts=4
set sw=4

" ignore case when searching, or not smartly
set ignorecase smartcase

" increment search by pressing <Enter>
set incsearch

" highlight searches when found
set hlsearch

" line wrappinig
set wrap

" make tile of console name of file
set title

" check spelling with F6
map <F6> :setlocal spell! spelllang=en_gb<CR>

" autoclose HTML tags
" iabbrev <// </<C-X><C-O>
au Filetype html,xml,xsl source ~/.vim/closetag.vim

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro;  '%r' is current file's root (base) name
nnoremap <leader>v :!evince %:r.pdf &<CR><CR>
