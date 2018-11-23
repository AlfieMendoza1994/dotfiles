" Set Commands
set nocompatible
set modifiable
set enc=utf-8  " Use an encoding that supports unicode
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set backspace=indent,eol,start  " Allow backspacing over indentation, line breaks, and insertion start
set autoindent  " New lines inherit indentation of previous lines
set ignorecase
set showmatch
set ruler  " Always show cursor position
set number " Show line numbers on the sidebar
set showcmd
set incsearch  " Incremental search that shows partial matches
set expandtab  " Convert tabs to spaces
set tabstop=2  " Indent using 2 spaces
set softtabstop=2
set shiftwidth=2
set noswapfile  " Disable swap files
set pastetoggle=<F3>
set laststatus=2  " Always display the status bar
set hidden  " Hide files in the background instead of closing them
set cursorline
set novisualbell
set noerrorbells  " Disable beep on errors
set listchars=tab:▸\ ,nbsp:⋅,trail:•
set list  " Displays whitespace
set hlsearch  " Enable search higlighting
set updatetime=250  " I overrode default (4000) for vim-gitgutter diff markers
set signcolumn=yes  " Displays signcolumn
hi Search cterm=NONE gui=NONE ctermbg=darkgreen ctermfg=white guibg=#6666ff guifg=white
hi CursorLine term=underline cterm=NONE gui=NONE ctermbg=darkyellow guibg=#996300

if (has("nvim"))
  set background=dark
  set termguicolors
endif

syntax enable  " Enable syntax highlighting

" Plugin Addon Settings

" Nerdtree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['node_modules']
if isdirectory(expand(".git"))
  let g:NERDTreeBookmarksFile = ".git/.nerdtree-bookmarks"
endif

" VimAirline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'
let g:airline_theme = "cool"

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden --path-to-ignore ~/.ignore'
endif

" Vim-DevIcons
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:DevIconsEnableFoldersOpenClose=1

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Indent Line
let g:indentLine_concealcursor=0

" NERDTree Syntax Highlight
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxEnabledExtensions = [
  \'yml', 'rb', 'js', 'coffee', 'erb', 'slim', 'css', 'scss', 'md', 'html',
  \'sql', 'jpg', 'jpeg', 'png', 'json', 'gif', 'jsx', 'py'
  \]

" Vundle Plugin Manager
filetype off
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'mileszs/ack.vim'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'junegunn/fzf'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'Yggdroot/indentLine'
call vundle#end()

filetype plugin indent on

" Auto Commands
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab fileformat=unix
au BufNewFile,BufRead *.scss,*.rb,*.js,*.jsx set tabstop=2 softtabstop=2 shiftwidth=2 expandtab fileformat=unix

" Custom Mappings
let mapleader = ","

" Refresh Config
nnoremap <leader><leader> :source $MYVIMRC<cr>

" NERDTree
nmap <leader>m :NERDTreeToggle<cr>

" Buffer Navigation
nnoremap <leader>q :bd<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>gb :ls<cr>:b<Space>

" File Finding
nnoremap <leader>f :FZFSilverSearcher<cr>

" Toggle Highlight Search
nnoremap <leader>t :set hls!<cr>

" Switch between splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" System Copy (Visual Mode) and Paste (Normal Mode)
vnoremap <leader>y "*y<cr>
nnoremap <leader>p "*p<cr>

" Move Vertically by Visual Line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Custom Functions
function! s:FZFWithSilverSearcher()
  let command = 'ag --vimgrep --hidden --path-to-ignore ~/.ignore -g ""'
  let options = '--preview "cat -n {}"'

  call fzf#run({
    \ 'source': command,
    \ 'sink': 'e',
    \ 'options': options,
    \ 'down': '50%' })
endfunction

" Custom Commands
command! ConvertToSingleQuotes %s/\"\([^"]*\)\"/'\1'/g
command! ConvertToDoubleQuotes %s/\'\([^']*\)\'/"\1"/g
command! RemoveUnnecessarySpaces %s/\s\+$//g
command! FZFSilverSearcher call s:FZFWithSilverSearcher()
