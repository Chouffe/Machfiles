"  __            __    __                 __
" /  |          /  |  /  |               /  |
" $$/  _______  $$/  _$$ |_    __     __ $$/  _____  ____
" /  |/       \ /  |/ $$   |  /  \   /  |/  |/     \/    \
" $$ |$$$$$$$  |$$ |$$$$$$/   $$  \ /$$/ $$ |$$$$$$ $$$$  |
" $$ |$$ |  $$ |$$ |  $$ | __  $$  /$$/  $$ |$$ | $$ | $$ |
" $$ |$$ |  $$ |$$ |  $$ |/  |__$$ $$/   $$ |$$ | $$ | $$ |
" $$ |$$ |  $$ |$$ |  $$  $$//  |$$$/    $$ |$$ | $$ | $$ |
" $$/ $$/   $$/ $$/    $$$$/ $$/  $/     $$/ $$/  $$/  $$/


" General settings {{{
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/functions.vim
source ~/.config/nvim/general/autocommands.vim
source ~/.config/nvim/keys/leader.vim
source ~/.config/nvim/keys/mappings.vim
luafile ~/.config/nvim/lua/general/utils.lua
" }}}

" Plugins configuration {{{
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/neomake.vim
source ~/.config/nvim/plug-config/lightline.vim
source ~/.config/nvim/plug-config/clojure.vim
source ~/.config/nvim/plug-config/which-key.vim
luafile ~/.config/nvim/lua/plug-config/compe.lua
luafile ~/.config/nvim/lua/plug-config/aniseed.lua
" }}}

" vim:foldmethod=marker:foldlevel=0
