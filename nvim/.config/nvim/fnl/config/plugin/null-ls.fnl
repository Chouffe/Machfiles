(fn config []
  (let [null-ls (require :null-ls)]
    (null-ls.setup {:sources [
                              ;; Python
                              ; null-ls.builtins.diagnostics.ruff
                              null-ls.builtins.formatting.isort
                              null-ls.builtins.formatting.docformatter
                              null-ls.builtins.formatting.black

                              ;; Fennel
                              null-ls.builtins.formatting.fnlfmt

                              ;; Markdown
                              null-ls.builtins.diagnostics.markdownlint

                              
                              ;; Shell
                              null-ls.builtins.diagnostics.shellcheck
                              null-ls.builtins.formatting.shfmt]})))


      

(comment
  (let [null-ls (require :null-ls)]
    null-ls.builtins.formatting.isort
    null-ls.builtins.formatting.docformatter
    null-ls.builtins.formatting.black
    null-ls.builtins.diagnostics.ruff))
  
                    

{: config}
