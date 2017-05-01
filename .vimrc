"" My vimrc file

" choose no compatibility with legacy vi
set nocompatible

" allow use of system clipboard
set clipboard=unnamed

" syntax is good
let python_highlight_all=1
syntax enable on

" show where i am
set cursorline

" utf-8 encoding is good
set encoding=utf-8

" spellchecking in English
set spelllang=en_gb

" display incomplete commands
set showcmd

" set runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

" Vundle plugins here
" Plugin 'tmhedberg/SimpylFold'
" Bundle 'Valloric/YouCompleteMe'
" Plugin 'nvie/vim-flake8'
" Plugin 'jnurmine/Zenburn'
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" end of Vundle plugins
" call vundle#end()

" load filetype plugins + indentation
filetype plugin indent on

" get a better colorscheme
colorscheme murphy

"" Whitespace

" don't wrap lines
set nowrap

" a tab is 4 spaces
set tabstop=4 shiftwidth=4 softtabstop=4

" use spaces, not tabs
" set expandtab

" backspace through everything in insert mode
set backspace=indent,eol,start

"" Searching

" highlight matches
set hlsearch

" increment searching
set incsearch

" searches are case insensitive...
set ignorecase

" ... unless they cotain at least one capital letter
set smartcase

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" webdev indentation
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" flag unneeded whitespace
highlight BadWhiteSpace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*c,*.h match BadWhiteSpace /\s\+$/

" YouCompleteMe customization
let g:uycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionsElseDeclaration<CR>
