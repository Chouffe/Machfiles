augroup configgroup
  autocmd!
  " Source the vimrc file after saving it
  autocmd BufWritePost .vimrc source $MYVIMRC
  autocmd BufWinLeave * call clearmatches()
  " autocmd BufWritePre * :call TrimWhiteSpace()
  autocmd BufWritePre * lua require('dotfiles.general.functions').trim_whitespace()
augroup END

augroup RAINBOW
  autocmd VimEnter * RainbowParenthesesActivate
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
  autocmd BufRead,BufNewFile * RainbowParenthesesActivate
  autocmd VimEnter * RainbowParenthesesActivate
  autocmd BufEnter * RainbowParenthesesLoadRound
  autocmd BufEnter * RainbowParenthesesLoadSquare
  autocmd BufEnter * RainbowParenthesesLoadBraces
augroup END
