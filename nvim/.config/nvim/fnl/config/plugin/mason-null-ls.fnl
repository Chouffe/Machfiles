(fn config []
  (let [mason-null-ls (require :mason-null-ls)]
    (mason-null-ls.setup {:ensure_installed ["black"
                                             "isort"
                                             "ruff"
                                             "fnlfmt"
                                             "markdownlint"
                                             "docformatter"
                                             "shellcheck"
                                             "shfmt"]})))

{: config}
