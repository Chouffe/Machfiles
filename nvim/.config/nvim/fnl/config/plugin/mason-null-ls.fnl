(fn config []
  (let [mason-null-ls (require :mason-null-ls)]
    (mason-null-ls.setup {:ensure_installed ["black"
                                             "isort"
                                             "ruff"
                                             "docformatter"
                                             "shellcheck"
                                             "shfmt"]})))

{: config}
