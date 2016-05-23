"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
call dein#begin(expand('/Users/ENIXER/.vim/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-endwise')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rails')
call dein#add('Shougo/unite.vim')
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('basyura/unite-rails')
call dein#add('ujihisa/neco-look', { 'depends' : ['neocomplete.vim']})
call dein#add('Shougo/neocomplete.vim', {'on_i': 1, 'lazy': 1})
call dein#add('powerline/powerline')
call dein#add('scrooloose/syntastic')
call dein#add('szw/vim-tags')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

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
set laststatus=2
set showtabline=2
set noshowmode
set smartcase
set incsearch
set backspace=indent,eol,start
set statusline+=%{fugitive#statusline()}
autocmd! Filetype html setlocal shiftwidth=2
autocmd! Filetype ruby setlocal shiftwidth=2
autocmd! Filetype eruby setlocal shiftwidth=2
autocmd BufWritePre * :FixWhitespace
autocmd QuickFixCmdPost *grep* cwindow

" alias
let NERDTreeShowHidden = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
set tags+=.tags
set tags+=.Gemfile.lock.tags
nnoremap <C-]> g<C-]>

" key mapping
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nmap <Space>t :NERTTreeToggle<CR>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap SS ZZ
nnoremap _ $
