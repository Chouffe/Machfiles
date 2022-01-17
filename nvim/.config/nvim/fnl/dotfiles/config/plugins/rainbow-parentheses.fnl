(module dotfiles.config.plugins.rainbow-parentheses
  {autoload {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(defn setup []
  (augroup "rainbow_parentheses"
    (autocmd :VimEnter "*" :RainbowParenthesesActivate)
    (autocmd :Syntax "*" :RainbowParenthesesLoadRound)
    (autocmd :Syntax "*" :RainbowParenthesesLoadSquare)
    (autocmd :Syntax "*" :RainbowParenthesesLoadSquare)
    (autocmd :BufRead "*" :RainbowParenthesesActivate)
    (autocmd :BufNewFile "*" :RainbowParenthesesActivate)))

(setup)
