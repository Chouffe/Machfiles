" Colors {{{
filetype plugin indent on       " Enable filetype plugins
syntax enable                   " Syntax highlighting
" }}}

" UX / Layout {{{
" Spaces / Tabs {{{
set expandtab         " tabs are spaces
set autoindent        " Indentation
set smartindent       " Indentation
" }}}
set spelllang=en_us              " Set region to American English
set mouse=a                      " Enable mouse usage in terminal vim
"set mouse=                       " Disable mouse usage in terminal vim
" set relativenumber               " Enable relative number
set number                       " Enable hybrid mode
set encoding=utf-8               " UTF-8 encoding
set scrolloff=3                  " Number of screen lines to show around the cursor
set showmatch                    " Show matches ({[
set pastetoggle=<F2>
set listchars=tab:▸\ ,eol:¬
" set textwidth=79               " Max text-width
" Wildmenu {{{
" Tab completion on the command line
set wildmenu
set wildmode=longest:full,full
" }}}
" Splits {{{
set splitbelow
set splitright
set laststatus=2                 " Status line always on
" }}}
" Folding {{{
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested folds max
" }}}
" }}}

" Searching {{{
set ignorecase         " ignore case when using a search pattern
set incsearch          " Highlight pattern matches as you type
set inccommand=nosplit " Live substitution in neovim only
set hlsearch           " Highlight the search results
" }}}


" Movement {{{
" Insert Mode {{{
" Exits INSERT mode without moving cursor (press jk || jj)
inoremap jk <ESC>l
inoremap jj <ESC>l
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
" }}}
" Normal mode {{{
" Remap the beginning of the line
nnoremap 0 ^
" Move to beginning/end of the line
nnoremap ` ^
nnoremap <BS> ^
nnoremap \ $
" nnoremap <CR> G
" move to the search
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
" }}}
" Visual block mode {{{
" nnoremap q <c-V>
" }}}
" Visual Mode {{{
vnoremap < <gv
vnoremap > >gv
vnoremap q <c-V>
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
" }}}
" }}}

" Misc {{{
" No bell
set noerrorbells visualbell t_vb=
" Reload files changed outside vim
set autoread
" No swap / backup files
set noswapfile
set nobackup
set nowritebackup
" Equivalent to set backspace=indent,eol,start " backspace over everything in insert mode
set backspace=2
" turn off search highlight
set hidden  " It hides buffers instead of closing them
" Preventing entering Ex mode
" nnoremap Q :bd %<CR>
" select last paste in visual mode
" nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" allows incsearch highlighting for range commands - VERY POWERFUL
" cnoremap $t <CR>:t''<CR>
" cnoremap $m <CR>:m''<CR>
" cnoremap $d <CR>:d<CR>``
" Sorting
vmap <C-s> !sort<CR>
" Splits
" nnoremap <silent> sv :vsplit<CR>
" nnoremap <silent> sh :split<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
