(fn config []
  (let [mason-null-ls (require :mason-null-ls)]
    (mason-null-ls.setup {:ensure_installed [:black
                                             :isort
                                             :prettier
                                             ; :ruff
                                             :clj_kondo
                                             :cljstyle
                                             :zprint
                                             :fnlfmt
                                             :yamllint
                                             :cfn_lint
                                             :markdownlint
                                             ; :docformatter
                                             ; :shellcheck
                                             :shellharden
                                             :shfmt]})))

{: config}
