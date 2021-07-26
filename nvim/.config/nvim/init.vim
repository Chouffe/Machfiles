" General settings
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/functions.vim
" luafile ~/.config/nvim/lua/general/functions.lua
source ~/.config/nvim/general/autocommands.vim
source ~/.config/nvim/keys/leader.vim
source ~/.config/nvim/keys/mappings.vim
luafile ~/.config/nvim/lua/general/utils.lua

" Plugins configuration
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/neomake.vim
source ~/.config/nvim/plug-config/lightline.vim
source ~/.config/nvim/plug-config/clojure.vim
luafile ~/.config/nvim/lua/plug-config/compe.lua
luafile ~/.config/nvim/lua/plug-config/aniseed.lua
luafile ~/.config/nvim/lua/general/lsp.lua

" vim:foldmethod=marker:foldlevel=0
