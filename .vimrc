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
call dein#begin(expand('~/.cache/'))

" load plugins
let g:rc_dir    = expand('~/.vim/plugins')
let s:toml      = g:rc_dir . '/on_start.toml'
let s:lazy_toml = g:rc_dir . '/lazy.toml'
call dein#load_toml(s:toml,      {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim')
call dein#add('basyura/unite-rails')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-surround')
call dein#add('upamune/esa.vim', { 'depends' : ['webapi-vim'] })
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
set encoding=utf-8
set fileencoding=utf-8
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>\ ,nbsp:%
set nobackup
set noshowmode
set noswapfile
set nowrap
set number
set redrawtime=2000
set ruler
set scrolloff=10
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set softtabstop=0
set tabstop=4
filetype plugin indent on
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype ruby setlocal shiftwidth=2
autocmd Filetype eruby setlocal shiftwidth=2
autocmd Filetype typescript setlocal shiftwidth=2
autocmd Filetype javascript setlocal shiftwidth=2
autocmd Filetype typescript.tsx setlocal shiftwidth=2
autocmd BufWritePre * call s:remove_last_blank_line()
autocmd QuickFixCmdPost *grep* cwindow
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

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

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

let g:esa_team = 'esminc'

" key mapping

nmap <Space>r [rails]
nnoremap [rails]m :<C-u>Unite rails/model<CR>
nnoremap [rails]v :<C-u>Unite rails/view<CR>
nnoremap [rails]c :<C-u>Unite rails/controller<CR>
nnoremap [rails]h :<C-u>Unite rails/helper<CR>
nnoremap [rails]g :<C-u>Unite rails/gemfile<CR>
nnoremap [rails]s :<C-u>Unite rails/stylesheet<CR>
nnoremap [rails]j :<C-u>Unite rails/javascript<CR>
nnoremap [rails]l :<C-u>Unite rails/log<CR>

nmap <Space>f [find]
nnoremap [find]f :<C-u>Unite file<CR>
nnoremap [find]b :<C-u>Unite buffer<CR>
nnoremap [find]t :<C-u>Unite tab<CR>
nnoremap [find]m :<C-u>Unite file_mru<CR>
nnoremap [find]a :<C-u>Unite file_rec<CR>
nnoremap [find]l :<C-u>Unite line<CR>
nnoremap [find]w :<C-u>Unite grep:.<CR><C-R><C-W><CR>

nmap <Space>g [git]
nnoremap [git]a :<C-u>Gwrite<CR>
nnoremap [git]c :<C-u>Gcommit<CR>
nnoremap [git]d :<C-u>Gdiff<CR>
nnoremap [git]b :<C-u>Gblame<CR>
nnoremap [git]m :<C-u>Gmove<Space>
nnoremap [git]r :<C-u>Gread<CR>
nnoremap [git]s :<C-u>Gstatus<CR>
nnoremap [git]l :<C-u>Glog<CR>

nnoremap <Space>a :<C-u>Ag<CR>

nnoremap <Space>; :<C-u>source ~/.vimrc<CR>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap m ^
nnoremap ; :
nnoremap : ;
nnoremap <C-j> i<CR><ESC>
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <Space>t :<C-u>tabnew<CR>
nnoremap <ESC><ESC> :<C-u>noh<CR>
nnoremap <C-n><C-n> :set nonumber!<CR>

inoremap <S-tab> <C-v><tab>
" functions
function! s:remove_last_blank_line()
  let pos = getpos('.')
  while getline('$') == "" && line ('$') != 1
    $delete _
  endwhile
  call setpos('.', pos)
endfunction

if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
