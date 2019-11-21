" indentation
set tabstop=2
set shiftwidth=2
set smarttab
set et

set ttyfast
set nocompatible
set autoindent
set lbr
set showcmd
set backspace=indent,eol,start

" no backups
set nobackup
set nowb
set noswapfile

set showmatch
set mat=2

" show tabs and trailing spaces
set list listchars=tab:>·,trail:·

" disable mouse
set mouse-=a

" increase history
set history=1000

" UI tweaks
set ruler
set nolazyredraw
set number

" no sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

let mapleader = ","
let g:mapleader = ","

" Various key bindings for fast actions
" map <leader><leader> <leader>
map <tab> <c-w>w
map <leader><tab> :tabnext<cr>
map <leader><s-tab> :tabprev<cr>
map <leader>w :w!<cr>
map <leader>q :wq<cr>
map <leader>z :q!<cr>

map <space> /
map <c-space> ?

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Specify undodir
set undodir=~/.vim_runtime/undodir
set undofile
set undoreload=10000

" Always hide the statusline
set laststatus=2

" Set 7 lines to the curors - when moving vertical..
set so=7

" Ctrl + C, Ctrl + V
map <C-v> "+gP
map <C-c> "+y
map <C-x> "+x

" Highlight 81 column
set colorcolumn=81
:highlight ColorColumn ctermbg=lightblue guibg=lightblue

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

set termencoding=utf-8
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
set linebreak
set encoding=utf-8
set fileencodings=utf8,cp1251
