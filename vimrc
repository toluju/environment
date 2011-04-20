" Set default size
if has("gui_running")
  set lines=40 columns=100
endif

" Tab settings.
set ts=8 sw=2 sts=2 expandtab 

" Preserve indentation when starting new lines.
set autoindent

" Turn on incremental searching.
set incsearch

" Turn off the annoying cpp warnings
let java_allow_cpp_keywords=""

" Turn off highlighing of search results.  You can also run ":noh" after a
" to remove highlighting for the last search.
"set nohlsearch

" Make backspace work like in a normal editor.
set backspace=indent,eol,start

" Honor vi mode lines in input files.
set modeline

" Don't do word wrap
set nowrap

" Enable syntax highlighting.
syntax on

" Turn on line numbering
set nu!

" Set colors
colors desert

" Turn on the ruler
set ruler

" Brian's settings
set showmatch
set ignorecase
set smartcase
set hlsearch

" To avoid cluttering directories, all backup files written to
" one location
set backup
set backupdir=~/.vim/bak

" Set the swap file directory so that swap files aren't in the same
" place as the files being edited.
set dir=~/.vim/bak
