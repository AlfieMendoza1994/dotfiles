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
set listchars=tab:▸\ ,nbsp:⋅,trail:•
set list
set hlsearch
set updatetime=250
set signcolumn=yes
set tags=~/.tags
hi Search cterm=NONE ctermbg=yellow ctermfg=white

syntax enable

"= Plugin Addon Settings

"= Nerdtree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
if isdirectory(expand(".git"))
  let g:NERDTreeBookmarksFile = ".git/.nerdtree-bookmarks"
endif
autocmd vimenter * NERDTree

"= VimAirline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'

"= Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden --path-to-ignore ~/.ignore'
endif

"= Vim-DevIcons
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:DevIconsEnableFoldersOpenClose=1

"= NERDTree Syntax Highlight
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxEnabledExtensions = [
  \'yml', 'rb', 'js', 'coffee', 'erb', 'slim', 'css', 'scss', 'md', 'html',
  \'sql', 'jpg', 'jpeg', 'png', 'json', 'gif', 'jsx', 'py'
  \]

"= Vundle Plugin Manager
filetype off
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'
  Plugin 'vim-airline/vim-airline'
  Plugin 'mileszs/ack.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'slim-template/vim-slim.git'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-rails'
  Plugin 'junegunn/fzf'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plugin 'ryanoasis/vim-devicons'
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
nnoremap <leader>1 :buffer 1<cr>
nnoremap <leader>2 :buffer 2<cr>
nnoremap <leader>3 :buffer 3<cr>
nnoremap <leader>4 :buffer 4<cr>
nnoremap <leader>5 :buffer 5<cr>
nnoremap <leader>6 :buffer 6<cr>
nnoremap <leader>7 :buffer 7<cr>
nnoremap <leader>8 :buffer 8<cr>
nnoremap <leader>9 :buffer 9<cr>
nnoremap <leader>lb :buffers<cr>

"= File Finding
nnoremap <leader>f :FZF<cr>

"= Toggle Highlight Search
nnoremap <leader>t :set hls!<cr>

"= Custom Commands
command! ConvertToSingleQuotes %s/\"\([^"]*\)\"/'\1'/g
command! ConvertToDoubleQuotes %s/\'\([^']*\)\'/"\1"/g
