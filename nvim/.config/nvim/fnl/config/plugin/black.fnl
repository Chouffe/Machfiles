(module config.plugin.black
  {autoload {a aniseed.core
             nvim aniseed.nvim}
   require-macros [config.macros]})

(defn config []
  (augroup :black_config
    (nvim.ex.autocmd :BufWritePre  "*py" "if exists(':Black') | execute ':Black' | endif")))