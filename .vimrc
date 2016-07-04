"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

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
call dein#add('Shougo/neocomplete.vim', {'on_i': 1, 'lazy': 1})
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/unite.vim')
call dein#add('basyura/unite-rails')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('mattn/webapi-vim')
call dein#add('powerline/powerline')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('szw/vim-tags')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-surround')
call dein#add('ujihisa/neco-look', { 'depends' : ['neocomplete.vim'] })
call dein#add('upamune/esa.vim', { 'depends' : ['webapi-vim'] })
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('ujihisa/unite-gem')
call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

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
set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>_,nbsp:%
set nobackup
set noshowmode
set noswapfile
set number
set ruler
set scrolloff=10
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set softtabstop=0
set statusline=%{fugitive#statusline()}
set tabstop=4
filetype plugin indent on
autocmd! Filetype html setlocal shiftwidth=2
autocmd! Filetype ruby setlocal shiftwidth=2
autocmd! Filetype eruby setlocal shiftwidth=2
autocmd BufWritePre * :FixWhitespace
autocmd QuickFixCmdPost *grep* cwindow

" alias
let NERDTreeShowHidden = 1
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
let g:esa_team = 'esminc'
set tags+=.tags
set tags+=.Gemfile.lock.tags
nnoremap <C-]> g<C-]>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" key mapping

nmap <Space>r [rails]
nnoremap [rails]m :<C-u>Unite rails/model<CR>
nnoremap [rails]v :<C-u>Unite rails/view<CR>
nnoremap [rails]c :<C-u>Unite rails/controller<CR>
nnoremap [rails]h :<C-u>Unite rails/helper<CR>
nnoremap [rails]g :<C-u>Unite rails/gemfile<CR>
nnoremap [rails]s :<C-u>Unite rails/stylesheet<CR>
nnoremap [rails]j :<C-u>Unite rails/javascript<CR>

nmap <Space>t :NERDTreeToggle<CR>

nmap <Space>f [find]
nnoremap [find]f :<C-u>Unite file<CR>
nnoremap [find]b :<C-u>Unite buffer<CR>
nnoremap [find]m :<C-u>Unite file_mru<CR>
nnoremap [find]a :<C-u>Unite file_rec<CR>
nnoremap [find]u :<C-u>CtrlPUndo<CR>
nnoremap [find]l :<C-u>Unite line<CR>

nmap <Space>s [syntax]
nnoremap [syntax]t :<C-u>SyntasticToggleMode<CR>
nnoremap [syntax]c :<C-u>SyntasticCheck<CR>
nnoremap [syntax]r :<C-u>SyntasticReset<CR>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap SS ZZ
nmap <Space>n :lnext<CR>
nmap <Space>p :lprevious<CR>
nnoremap <C-p> <Nop>
nnoremap <ESC><ESC> :<C-u>noh<CR>
