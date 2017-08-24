set nocompatible              " required

filetype off                  " required
syntax on
let python_highlight_all=1
call togglebg#map("<F5>")
let NERDTreeIgnore=['\.pyc$', '\~$']
set number
colorscheme Zenburn
"set mouse=a
set mousehide
set hlsearch
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,] 
set guifont=Consolas,Bitstream_Vera_Sans_Mono:h9:cANSI

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'Valloric/YouCompleteMe'
Bundle 'jnurmine/Zenburn'
Bundle 'altercation/vim-colors-solarized'


Bundle "bling/vim-airline"
Bundle 'yssource/python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'
Bundle 'hdima/python-syntax'
Bundle 'hynek/vim-python-pep8-indent'
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set splitbelow
set splitright

"split navigations
nnoremap<C-J><C-W><C-J>
nnoremap<C-K><C-W><C-K>
nnoremap<C-L><C-W><C-L>
nnoremap<C-H><C-W><C-H>

"Enable folding
nnoremap <space> za


let g:SimpyFold_docstring_preview=1

au BufNewFile,BufRead *.py
			\set tabstop=4
			\set softtabstop=4
			\set shiftwidth=4
			\set textwidth=79
			\set expandtab
			\set autoindent
			\set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
			\set tabstop=2
			\set softtabstop=2
			\set shiftwidth=2

au BufRead,BufNewFile *.py.*。pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8


let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support"
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    EOF
 

set rtp+=/usr/local/lib/python2.7/dist-packages


" These lines setup the environment to show graphics and colors correctly."
set nocompatible
set t_Co=256
 
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
 
if !has('gui_running'):
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
 
set laststatus=2 " Always display the statusline in all windows"
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)"
EOF


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
