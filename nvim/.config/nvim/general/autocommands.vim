augroup configgroup
  autocmd!
  autocmd BufWinLeave * call clearmatches()
  autocmd BufWritePre * :call TrimWhiteSpace()
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
