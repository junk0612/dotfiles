"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/ENIXER/.vim//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/ENIXER/.vim/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

syntax enable
colorscheme desert
set number
set cursorline
set scrolloff=5
set noswapfile
set nobackup
set autoread
set autoindent
set smartindent
filetype plugin indent on
set ruler
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=0
set hlsearch
set showmatch
set showcmd
set ignorecase
set smartcase
set incsearch
set backspace=indent,eol,start
autocmd! Filetype html setlocal shiftwidth=2
autocmd! Filetype ruby setlocal shiftwidth=2
autocmd! Filetype eruby setlocal shiftwidth=2

