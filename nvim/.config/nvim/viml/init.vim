"  __            __    __                 __
" /  |          /  |  /  |               /  |
" $$/  _______  $$/  _$$ |_    __     __ $$/  _____  ____
" /  |/       \ /  |/ $$   |  /  \   /  |/  |/     \/    \
" $$ |$$$$$$$  |$$ |$$$$$$/   $$  \ /$$/ $$ |$$$$$$ $$$$  |
" $$ |$$ |  $$ |$$ |  $$ | __  $$  /$$/  $$ |$$ | $$ | $$ |
" $$ |$$ |  $$ |$$ |  $$ |/  |__$$ $$/   $$ |$$ | $$ | $$ |
" $$ |$$ |  $$ |$$ |  $$  $$//  |$$$/    $$ |$$ | $$ | $$ |
" $$/ $$/   $$/ $$/    $$$$/ $$/  $/     $$/ $$/  $$/  $$/


" TODO: move to another ns {{{
" let g:sexp_insert_after_wrap = 0 " Disable insertion after wrapping
" let g:sexp_enable_insert_mode_mappings = 0 " Make sure vim-sexp plays nicely with parinfer
" }}}

" General settings {{{
source ~/.config/nvim/viml/general/settings.vim
source ~/.config/nvim/viml/general/functions.vim
source ~/.config/nvim/viml/general/autocommands.vim
source ~/.config/nvim/viml/keys/leader.vim
source ~/.config/nvim/viml/keys/mappings.vim
" }}}

" Plugins configuration {{{
source ~/.config/nvim/viml/config/plugin/fzf.vim
source ~/.config/nvim/viml/config/plugin/neomake.vim
source ~/.config/nvim/viml/config/plugin/lightline.vim
source ~/.config/nvim/viml/config/plugin/clojure.vim
source ~/.config/nvim/viml/config/plugin/which-key.vim
" luafile ~/.config/nvim/lua/plug-config/compe.lua
" luafile ~/.config/nvim/lua/plug-config/aniseed.lua
" }}}

" vim:foldmethod=marker:foldlevel=0
