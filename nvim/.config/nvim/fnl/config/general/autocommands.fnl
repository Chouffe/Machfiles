(module config.general.autocommands
  {autoload {nvim aniseed.nvim
             functions config.general.functions}
   require-macros [config.macros]})

(defn setup []
  (augroup :config_group
    (autocmd :BufWritePost ".vimrc" "source $MYVIMRC")
    (autocmd :BufWinLeave "*" "call clearmatches()")
    (autocmd :BufWritePre "*" "lua require('dotfiles.general.functions').trim_whitespace()")))

(setup)
