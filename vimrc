"= Set Commands
set nocompatible
set modifiable
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set backspace=indent,eol,start
set autoindent
set ignorecase
set showmatch
set ruler
set number
set showcmd
set incsearch
set expandtab
set tabstop=2
set noswapfile
set pastetoggle=<F3>
set laststatus=2
set hidden
set cursorline
set visualbell
set noerrorbells
set listchars=trail:•
set list

syntax enable

"Plugin Addon Settings
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
if isdirectory(expand(".git"))
  let g:NERDTreeBookmarksFile = ".git/.nerdtree-bookmarks"
endif
let g:airline#extensions#tabline#enabled = 1
autocmd vimenter * NERDTree

"= Vundle Plugin Manager
filetype off
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-airline/vim-airline'
  Plugin 'mileszs/ack.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'slim-template/vim-slim.git'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'junegunn/fzf'
  Plugin 'tomtom/tcomment_vim'
call vundle#end()

filetype plugin indent on

"= Auto Commands
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab fileformat=unix
au BufNewFile,BufRead *.rb,*.js,*.jsx set tabstop=2 softtabstop=2 shiftwidth=2 expandtab fileformat=unix

"= Custom Mappings
let mapleader = ","

"= Refresh Config
nnoremap <leader><leader> :source $MYVIMRC<cr>

"= NERDTree
nmap <leader>n :NERDTree<cr>
nmap <leader>m :NERDTreeToggle<cr>
nnoremap <leader>B :Bookmark
nnoremap <leader>cd :OpenBookmark<space>

"= Buffer Navigation
nnoremap <leader>q :bd<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>

"= File Finding
nnoremap <leader>f :FZF<cr>

"= Custom Commands
command! ConvertToSingleQuotes %s/\"\([^"]*\)\"/'\1'/g
command! ConvertToDoubleQuotes %s/\'\([^']*\)\'/"\1"/g
