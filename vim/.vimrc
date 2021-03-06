" .vimrc

" ===========================================================
" ========                 Settings                  ========
" ===========================================================

" Enable syntax highlighting and set colorscheme
syntax on
colorscheme minimalist

set backspace=indent,eol,start

" Search
set incsearch

" Toggle line numbers with Ctr-N, Ctr-N
set number

set timeoutlen=500

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" " On pressing tab, insert 2 spaces
" set expandtab

" scroll one line (I commented out because of disabled mouse)
" :map <ScrollWheelUp> <C-Y>
" :map <ScrollWheelDown> <C-E>

" Set words with dashes as words
set iskeyword+=-

" Switch from an unsaved buffer without saving it first.
set hidden

" Better command-line completion
set wildchar=<Tab> wildmenu wildmode=longest,list,full

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set mouse-=a


" Status Line {
        set laststatus=2                             " always show statusbar
        set statusline=
        set statusline+=%-10.3n\                     " buffer number
        set statusline+=%f\                          " filename
        set statusline+=%h%m%r%w                     " status flags
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
        set statusline+=%=                           " right align remainder
        set statusline+=0x%-8B                       " character value
        set statusline+=%-14(%l,%c%V%)               " line, character
        set statusline+=%<%P                         " file position
"}

set autochdir

let mapleader = " "

set splitbelow
set splitright


" ===========================================================
" ========                 Bindings                  ========
" ===========================================================

:nmap <C-N><C-N> :set number!<CR>
:nmap <C-N><C-R> :set relativenumber!<CR>

" Map quit insert mode to 'ctrl-c'
:inoremap <C-c> <C-[>

inoremap xx <Esc>

nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bl :ls<CR>:b<Space>
nnoremap <Leader>bb :b <C-d>

nnoremap <Leader>% :vsp<CR>
nnoremap <Leader>" :sp<CR>
map <Leader><Leader> :b#<CR><esc>

" nnoremap <Leader>W :g/^$/d<CR>gg<c-v>GI"<esc>gg<c-v>G$A",<esc>ggVGJ$xa]<esc>0i[<esc>

nnoremap Y y$


" ===========================================================
" ========                 Plugins                   ========
" ===========================================================

" vim-slime
let g:slime_target = "tmux"

" vimux
let g:VimuxHeight = "25"
command VimuxFocusRunner :call _VimuxTmux("select-"._VimuxRunnerType()." -t ".g:VimuxRunnerIndex)
map <Leader>sml :call VimuxRunCommand("sml")<CR> :call VimuxSendText("use \"" . bufname("%") . "\"\\;")<CR> :VimuxFocusRunner<CR>
" map <Leader>py :call VimuxRunCommand("python3")<CR> :VimuxFocusRunner<CR>
map <Leader>z :call VimuxZoomRunner()<CR>

" tcomment_vim
map <Leader>/ gcc
vmap <Leader>/ gc

" fzf.vim
set rtp+=/usr/local/opt/fzf
nmap <Leader>bb :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :History:<CR>

" vim-markdown-preview
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1

" vim-bufkill
map <Leader>bd :BD<CR>


" ===========================================================
" ========                 New Stuff                   ========
" ===========================================================

" enable setting title
set title
" configure title to look like: Vim /path/to/file
set titlestring=vim\ %-25.55F\ %a%r%m titlelen=70

inoremap <Tab> <C-X><C-F>

let g:rooter_silent_chdir = 1

set list lcs=tab:\|\

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

hi ALEWarning ctermbg=181

" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \}

let g:ale_linters = {
\   'ruby': ['standardrb', 'rubocop'],
\}

set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" let g:kitty_navigator_no_mappings = 1
"
" nnoremap <silent> <c-h> :KittyNavigateLeft<cr>
" nnoremap <silent> <c-j> :KittyNavigateDown<cr>
" nnoremap <silent> <c-k> :KittyNavigateUp<cr>
" nnoremap <silent> <c-l> :KittyNavigateRight<cr>


nnoremap <esc> :noh<return><esc>

