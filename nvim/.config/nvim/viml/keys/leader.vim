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
nnoremap <leader>et :edit ~/.tmux.conf<CR>
" Scroll Off
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" nnoremap <silent><Leader>t :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -auto-expand -toggle -no-quit<CR>
" nnoremap <silent><Leader>t :<C-u>NERDTreeToggle<CR>
" nnoremap <silent><Leader>t :<C-u>NERDTreeToggle<CR>
nnoremap <silent><Leader>t :<C-u>NvimTreeToggle<CR>
" nnoremap <silent><Leader>r :<C-u>NERDTreeToggle %<CR>
nnoremap <silent><Leader>r :<C-u>NvimTreeFindFileToggle<CR>
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
" nnoremap <Leader>cc <cmd>lua require('dotfiles.general.functions').toggle_highlight_at_colorcolumn()<cr>
nnoremap <Leader>cc <cmd>ToggleHiglightAtColorColumn<CR>
" Key bindings for adjusting tee tab/shift width.
nnoremap <leader>w2 :setlocal tabstop=2<CR>:setlocal shiftwidth=2<CR>
nnoremap <leader>w4 :setlocal tabstop=4<CR>:setlocal shiftwidth=4<CR>
nnoremap <leader>w8 :setlocal tabstop=8<CR>:setlocal shiftwidth=8<CR>

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

" All mappings currently moved to FZF
" Search section
" --------------
" Find files -> done with FZF lua
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <silent><C-p>Telescope find_files<CR>
" Live grep
" fzf lua is providing live grep for now -> see bindings there
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Grep with word under cursor
" nnoremap <leader>fa <cmd>Telescope grep_string<cr>
" Find buffers -> done with FZF lua
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Find in current buffer - FZFLua does this
" nnoremap <leader>fl <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
" Find LSP references
" nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
" Find notes -> Done with FZF Lua
" nnoremap <leader>fn <cmd>lua require "telescope".extensions.file_browser.file_browser({cwd = "~/notes"})<cr>
" Find vim config
" nnoremap <leader>fv <cmd>lua require "telescope".extensions.file_browser.file_browser({cwd = "~/.config/nvim"})<cr>
" Find help tags -> done with fzf lua
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Find marks -> done with fzf lua
" nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <silent><leader>tb :lua require('telescope.builtin').builtin()<CR>
" }}}


" FZF {{{
" nnoremap <silent><leader>ff :FzfLua files<cr>
" nnoremap <silent><leader>ff <CMD>Telescope find_files<cr>
nnoremap <silent><leader>ff :lua require('telescope.builtin').find_files()<CR>
" nnoremap <silent><leader>fb :FzfLua buffers<cr>
nnoremap <silent><leader>fb :lua require('telescope.builtin').buffers()<CR>
" nnoremap <silent><Leader>fl :FzfLua lines<CR>
" nnoremap <silent><Leader>fw :FzfLua grep_cword<CR>
" nnoremap <silent><Leader>fw <CMD>Telescope grep_string<CR>
nnoremap <silent><leader>fw :lua require('telescope.builtin').grep_string()<CR>
" nnoremap <silent><Leader>fW :FzfLua grep_cWORD<CR>
" nnoremap <silent><Leader>fg :FzfLua live_grep<CR>
" nnoremap <leader>fg <cmd>FZFRg<CR>
nnoremap <silent><leader>fg :lua require('telescope.builtin').live_grep()<CR>
" nnoremap <silent><Leader>fr :FzfLua resume<CR>
nnoremap <silent><leader>fr :lua require('telescope.builtin').resume()<CR>
" nnoremap <silent><Leader>f: :FzfLua command_history<CR>
nnoremap <silent><leader>f: :lua require('telescope.builtin').command_history()<CR>
" nnoremap <silent><Leader>f/ :FzfLua search_history<CR>
nnoremap <silent><leader>f/ :lua require('telescope.builtin').search_history()<CR>
" nnoremap <silent><Leader>fm :FzfLua marks<CR>
nnoremap <silent><leader>fm :lua require('telescope.builtin').marks()<CR>
nnoremap <silent><Leader>fh :FzfLua help_tags<CR>
nnoremap <silent><leader>fh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <silent><Leader>fn :lua require('fzf-lua').files({ cwd = '~/notes' })<CR>
nnoremap <silent><Leader>fvg :lua require('fzf-lua').live_grep({ cwd = '~/.config/nvim' })<CR>
nnoremap <silent><Leader>fvf :lua require('fzf-lua').files({ cwd = '~/.config/nvim' })<CR>

" nnoremap <silent><C-f> :FZFBLines<CR>
" nnoremap <silent><C-f> :FzfLua lines<CR>
" nnoremap <silent><Leader>a :FzfLua grep_cword<CR>
" nnoremap <silent><M-f> :FZFLines<CR>
" nnoremap <silent> <Leader>a :FZFRg <C-R><C-W><CR>
" nnoremap <silent> <Leader>: :FZFHistory:<CR>
" nnoremap <silent> <Leader>/ :FZFHistory/<CR>
" nnoremap <silent><C-q> :FZFRg <C-R><C-W><CR>
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
