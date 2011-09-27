" Disable vi compatability mode
set nocompatible

" Set default size
if has("gui_running")
  set lines=50 columns=200
endif

" Tab settings.
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab

" Force utf8 encoding
set encoding=utf-8

" Preserve indentation when starting new lines.
set autoindent

" Turn on incremental searching.
set incsearch

" Turn off the annoying cpp warnings
let java_allow_cpp_keywords=""

" Make backspace work like in a normal editor.
set backspace=indent,eol,start

" Honor vi mode lines in input files.
set modeline

" Don't do word wrap
set nowrap

" Disable the gui toolbar
set guioptions-=T

" Enable syntax highlighting.
syntax on

" Turn on line numbering
set nu!

" Set colors
colors desert

" Turn on the ruler
set ruler

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Set the swap file directory so that swap files aren't in the same
" place as the files being edited. Not necessary with the above options,
" but leaving it around if any of the options change.
set dir=~/.vim/bak

" Remap semi-colon to colon, save keystrokes
nnoremap ; :

" Remap the annoying help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Set the leader key to comma
let mapleader = ","

" Fix vim's regex handling
nnoremap / /\v
vnoremap / /\v

" Search settings
set ignorecase
set showmatch
set ignorecase
set smartcase
set hlsearch

" Clear search highlight shortcut
nnoremap <leader><space> :noh<cr>

" Jump to matching brace shortcut
nnoremap <tab> %
vnoremap <tab> %

" Autosave on lose focus
au FocusLost * :wa

" Key binding to close a buffer without closing the window split
nmap ,d :b#<bar>bd#<CR>
