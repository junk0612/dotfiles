"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Download dein.vim unless it is installed
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

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

" Required:
call dein#end()

" Required:
filetype plugin indent on

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Uninstall if plugins are removed from toml file.
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
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
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype ruby setlocal shiftwidth=2
autocmd Filetype eruby setlocal shiftwidth=2
autocmd FileType go setlocal noexpandtab
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

vnoremap ; :
vnoremap : ;

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
