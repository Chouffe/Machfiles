" augroup configgroup
"   autocmd!
"   " Source the vimrc file after saving it
"   autocmd BufWritePost .vimrc source $MYVIMRC
"   autocmd BufWinLeave * call clearmatches()
"   " autocmd BufWritePre * :call TrimWhiteSpace()
"   autocmd BufWritePre * lua require('dotfiles.general.functions').trim_whitespace()
" augroup END
