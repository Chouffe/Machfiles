(fn config []
  (let [null-ls (require :null-ls)]
    (null-ls.setup {:sources [;; Trailing whitespace
                              ; null-ls.builtins.formatting.trim_whitespace
                              null-ls.builtins.diagnostics.trail_space
                              null-ls.builtins.formatting.prettier
                              ;; Python
                              ; null-ls.builtins.diagnostics.ruff
                              null-ls.builtins.formatting.isort
                              ; null-ls.builtins.formatting.docformatter
                              null-ls.builtins.formatting.black
                              ;; Clojure
                              ; null-ls.builtins.formatting.zprint
                              ; null-ls.builtins.formatting.cljstyle
                              null-ls.builtins.diagnostics.clj_kondo
                              ;; Fennel
                              ; null-ls.builtins.formatting.fnlfmt
                              ;; Markdown
                              null-ls.builtins.diagnostics.markdownlint
                              null-ls.builtins.formatting.markdownlint
                              ;; Yaml
                              null-ls.builtins.diagnostics.yamllint]})))
                              ;; Shell
                              ; null-ls.builtins.diagnostics.shellcheck
                              ; null-ls.builtins.formatting.shellharden
                              ; null-ls.builtins.formatting.shfmt]})))

{: config}
