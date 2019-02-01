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
set relativenumber " Display line numbers relative to current line
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
set background=dark " Vim will use colors that look good on dark background
hi Search cterm=NONE gui=NONE ctermbg=darkgreen ctermfg=white guibg=#6666ff guifg=white
hi CursorLine term=underline cterm=NONE gui=NONE ctermbg=darkyellow guibg=#996300

if (has("nvim"))
  set termguicolors
endif

syntax enable  " Enable syntax highlighting

" Plugin Addon Settings

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter% - %severity%] %s'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'jsx': ['eslint'],
\  'ruby': ['rubocop'],
\ }
highlight ALEErrorSign ctermfg=9 guifg=#C30500
highlight ALEWarningSign ctermfg=11 guifg=#FFB316

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
  Plugin 'w0rp/ale'
call vundle#end()

filetype plugin indent on

" Custom Mappings
let mapleader = ","

" Refresh Config
nnoremap <silent><leader><leader> :source $MYVIMRC<cr>

" NERDTree
nnoremap <silent><leader>m :NERDTreeToggle<cr>

" ALE
nnoremap <silent><leader>] :ALENext<cr>
nnoremap <silent><leader>[ :ALEPrevious<cr>

" Buffer Navigation
nnoremap <silent><leader>q :bd<cr>
nnoremap <silent><leader>h :bp<cr>
nnoremap <silent><leader>l :bn<cr>
nnoremap <silent><leader>gb :ls<cr>:b<Space>

" File Finding
nnoremap <silent><leader>f :FZFSilverSearcher<cr>

" Toggle Highlight Search
nnoremap <silent><leader>t :set hls!<cr>

" System Copy (Visual Mode) and Paste (Normal Mode)
vnoremap <silent><leader>y "*y<cr>
nnoremap <silent><leader>p "*p<cr>

" Move Vertically by Visual Line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Custom Functions
function! s:FZFWithSilverSearcher()
  let command = 'ag --vimgrep --hidden --path-to-ignore ~/.ignore -g ""'

  " I don't need file preview but it's useful option to know
  " let options = '--preview "cat -n {}"'
  let options = ''

  call fzf#run({
    \ 'source': command,
    \ 'sink': 'e',
    \ 'options': options,
    \ 'down': '50%' })
endfunction

" Custom Commands
command! ConvertToSingleQuotes %s/\"\([^"]*\)\"/'\1'/g
command! ConvertToDoubleQuotes %s/\'\([^']*\)\'/"\1"/g
command! RemoveTrailingSpaces %s/\s\+$//g
command! FZFSilverSearcher call s:FZFWithSilverSearcher()
