" Vim expand region
" vmap v <Plug>(expand_region_expand)
" vmap <C-V> <Plug>(expand_region_shrink)

" Compe {{{
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" }}}

" Parinfer {{{
" nnoremap <Localleader>pp <cmd>lua require('dotfiles.general.functions').toggle_parinfer()<cr>
" nnoremap <Localleader>pp <cmd>ParinferToggle<CR>
" }}}

" Terminal {{{
" tnoremap <Esc> <C-\><C-n>
" tnoremap <silent><C-g> <C-\><C-n>:close<CR>
" tnoremap jk <C-\><C-n>
" tnoremap jj <C-\><C-n>
" }}}
