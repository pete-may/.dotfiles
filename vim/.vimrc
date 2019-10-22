" Features
"-----------------------------------------------------------

" Enable syntax highlighting
syntax on

" Colorscheme
colorscheme minimalist 

" Search
set incsearch

" Toggle line numbers with Ctr-N, Ctr-N
:nmap <C-N><C-N> :set invnumber<CR>

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" scroll one line
:map <ScrollWheelUp> <C-Y>
:map <ScrollWheelDown> <C-E>



" Must have options 
"------------------------------------------------------------

" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Usability options
"------------------------------------------------------------

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Hit space to insert a character and return to normal mode
:nnoremap <Space> i_<Esc>r

" Map quit vim to 'ctrl-c'
:inoremap <C-c> <C-[>

" Pathogen
source ~/.dotfiles/vim/autoload/pathogen.vim
execute pathogen#infect('~/.dotfiles/vim/bundle/{}')
nnoremap gb :bn<cr>
nnoremap gB :bp<cr>
:set mouse=n
