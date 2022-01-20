" Leader Shortcuts {{{
let mapleader="\<Space>"
let maplocalleader=","
" }}}

" Leader Mappings {{{
" Remap the ex command
nnoremap <Leader><Leader> V
nnoremap <silent><Leader>q :q<CR>
vnoremap <Leader><Leader> :
" Escapes visual mode
vnoremap <C-g> <ESC>
" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <Leader><CR> :noh<CR>
" Treat long lines as break lines (useful when moving around in them)
nnoremap <Leader><CR> :nohlsearch<CR>
" Save a file
nnoremap <Leader>w :w<CR>
" Paste
nnoremap <silent> <leader>p :set paste!<CR>"+p :set paste!<CR>
" quickfix window
nnoremap <Leader>e :call ToggleQuickfix()<CR>
nnoremap <Leader>en :cn<CR>
nnoremap <Leader>el :cl<CR>
nnoremap <Leader>ep :cp<CR>
" Copy & paste to system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>y "+yy
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
" Splits
nnoremap <silent> <Leader>k :vsplit<CR>
nnoremap <silent> <Leader>j :split<CR>
" Edit config files
" nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>ev <cmd>lua require('telescope.builtin').file_browser({cwd = "~/.config/nvim"})<cr>
nnoremap <leader>et :edit ~/.tmux.conf<CR>
" Scroll Off
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" nnoremap <silent><Leader>t :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -auto-expand -toggle -no-quit<CR>
" nnoremap <silent><Leader>t :<C-u>NERDTreeToggle<CR>
nnoremap <silent><Leader>t :<C-u>NERDTreeToggle<CR>
nnoremap <silent><Leader>r :<C-u>NERDTreeToggle %<CR>
" nnoremap <silent><Leader>f :<C-u>NERDTreeToggle %<CR>
" Spell checking
nnoremap <silent> <leader>s :set spell!<CR>
" Numbers
nnoremap <silent> <leader>n :set number!<CR>
" Color the colorcolumn
" nnoremap <Leader>cc <cmd>lua require('general/functions').highlight_at_colorcolumn()<cr>
" nnoremap <Leader>cc <cmd>lua require('functions').highlight_at_colorcolumn()<cr>
" nnoremap <Leader>cc <cmd>lua require('general.functions').highlight_at_colorcolumn()<cr>
" nnoremap <Leader>cc <cmd>lua require('general.functions').toggle_highlight_at_colorcolumn()<cr>
nnoremap <Leader>cc <cmd>lua require('dotfiles.general.functions').toggle_highlight_at_colorcolumn()<cr>
" Key bindings for adjusting tee tab/shift width.
nnoremap <leader>w2 :setlocal tabstop=2<CR>:setlocal shiftwidth=2<CR>
nnoremap <leader>w4 :setlocal tabstop=4<CR>:setlocal shiftwidth=4<CR>
nnoremap <leader>w8 :setlocal tabstop=8<CR>:setlocal shiftwidth=8<CR>
" Shows file name
nnoremap <Leader>gg :call ColorEcho("Filename> ", expand('%:p'))<CR>
" Copy the filename to the unamed register
nnoremap <Leader>gy :let @+ = expand("%:p")<CR>:call ColorEcho("Filename> ", expand('%:p'), " → copied to clipboard")<CR>

" Git {{{
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gl :Git log -1000<CR>
nnoremap <Leader>ggp :Git push<CR>
nnoremap <Leader>ggl :Git pull<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
" }}}

" Buffers {{{
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
" Close all buffers but the current one
nnoremap <Leader>x :only<CR>
" Close the current buffer and back to the last edited
nnoremap <Leader>d <cmd>lua require('dotfiles.general.functions').delete_buffer()<cr>
nnoremap <LocalLeader>d <cmd>lua require('dotfiles.general.functions').delete_buffer()<cr>
" }}}
"}}


" Telescope {{{

" Search section
" --------------
" Find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent><C-p>Telescope find_files<CR>
" Live grep
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Grep with word under cursor
" nnoremap <leader>fa <cmd>Telescope grep_string<cr>
" Find buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Find in current buffer
nnoremap <leader>fl <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
" Find LSP references
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
" Find notes
nnoremap <leader>fn <cmd>lua require "telescope".extensions.file_browser.file_browser({cwd = "~/notes"})<cr>
nnoremap <leader>fv <cmd>lua require "telescope".extensions.file_browser.file_browser({cwd = "~/.config/nvim"})<cr>
" Find help tags
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Find marks
nnoremap <leader>fm <cmd>Telescope marks<cr>
" }}}


" FZF {{{
nnoremap <silent><C-f> :FZFBLines<CR>
nnoremap <silent><M-f> :FZFLines<CR>
nnoremap <silent> <Leader>a :FZFRg <C-R><C-W><CR>
nnoremap <silent> <Leader>: :FZFHistory:<CR>
nnoremap <silent> <Leader>/ :FZFHistory/<CR>
nnoremap <silent><C-q> :FZFRg <C-R><C-W><CR>
" nnoremap <silent><C-s> :<C-u>Unite neosnippet -start-insert<CR>
" nnoremap <silent> <C-y> :<C-u>Unite history/yank<CR>
" nnoremap <silent><M-g> :FZFAg<CR>'
" nnoremap <silent><M-g> :FZFRg<CR>'
" nnoremap <silent><M-p> :FZFFiles<CR>
" nnoremap <silent><C-b> :FZFBuffers<CR>
" nnoremap <silent><M-b> :FZFBuffers<CR>
" nnoremap <silent><M-t> :Unite -buffer-name=tags tag -start-insert<CR>
" nnoremap <silent><M-f> :Unite -buffer-name=buffer-tags tag:% -start-insert<CR>
" nnoremap <silent><C-t> :FZFBTags<CR>
" nnoremap <silent><M-t> :FZFTags<CR>
" nnoremap <silent><M-o> :FZFLines<CR>
" nnoremap <silent><M-m> :FZFMarks<CR>
" nnoremap <silent><C-m> :FZFMarks<CR>
" }}}

" Formatting with external tools {{{
" JSON
nnoremap <silent> <Leader>Fj :%!jq --sort-keys<CR>
vnoremap <silent> <Leader>Fj :!jq --sort-keys<CR>
" EDN
nnoremap <silent> <Leader>Fe :%!jet --pretty<CR>
vnoremap <silent> <Leader>Fe :!jet --pretty<CR>
" }}}

" Insert date and time {{{
nnoremap <Leader>Id "=strftime("%Y-%m-%d")<CR>p
" }}}

" vim:foldmethod=marker:foldlevel=0
