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
"source ~/.config/nvim/viml/general/settings.vim
"source ~/.config/nvim/viml/general/filetypes.vim

" Get XDG_CONFIG_HOME or fallback to the default ~/.config path
let config_home = getenv("XDG_CONFIG_HOME")
if empty(config_home)
  let config_home = "~/.config"
endif

" Source the VimL files using the config_home path
execute 'source ' . expand(config_home . '/nvim/viml/general/settings.vim')
execute 'source ' . expand(config_home . '/nvim/viml/general/filetypes.vim')
" }}}

" vim:foldmethod=marker:foldlevel=0
