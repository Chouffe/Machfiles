" General settings
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/functions.vim
luafile ~/.config/nvim/lua/general/functions.lua
source ~/.config/nvim/general/autocommands.vim
source ~/.config/nvim/keys/leader.vim
source ~/.config/nvim/keys/mappings.vim

" Plugins configuration
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/neomake.vim
source ~/.config/nvim/plug-config/lightline.vim
source ~/.config/nvim/plug-config/clojure.vim
luafile ~/.config/nvim/lua/plug-config/compe.lua
luafile ~/.config/nvim/lua/general/lsp.lua

lua << EOF
-- Useful for debugging lua
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
EOF

" vim:foldmethod=marker:foldlevel=0
