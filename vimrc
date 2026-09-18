" ============================================================
" Minimal, portable .vimrc — plain vim, no plugins, no NvChad
" Works on any stock vim install (servers, network gear, SSH boxes)
" ============================================================

set nocompatible
syntax on
filetype plugin indent on

" ---------- Basics ----------
set number
set relativenumber
set hlsearch incsearch
set ignorecase smartcase
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent
set scrolloff=8
set nowrap
set noswapfile nobackup
set encoding=utf-8
set backspace=indent,eol,start
set laststatus=2
set updatetime=300
set clipboard=unnamedplus
set mouse=a
set wildmenu
set showmatch
set splitright splitbelow

" ---------- Leader ----------
let mapleader = " "

" ---------- Mappings ----------
nnoremap ; :
inoremap jk <Esc>

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <leader>w :w<CR>

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>cl :call ToggleColorColumn()<CR>
function! ToggleColorColumn()
  if &colorcolumn == ""
    set colorcolumn=80
  else
    set colorcolumn=
  endif
endfunction

nnoremap <leader>ws :call ToggleWhitespace()<CR>
function! ToggleWhitespace()
  if &list
    set nolist
  else
    set list
    set listchars=space:·,tab:>-,eol:$
  endif
endfunction

nnoremap \ A

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <leader><Esc> :wa<CR>:qa!<CR>

nnoremap <leader>nh :nohlsearch<CR>

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>i :call InsertComment()<CR>
function! InsertComment()
  let l:ft = &filetype
  if l:ft ==# 'python' || l:ft ==# 'sh'
    execute "normal! A  #  "
  else
    execute "normal! A /*  */"
    normal! F 
  endif
  startinsert!
endfunction
