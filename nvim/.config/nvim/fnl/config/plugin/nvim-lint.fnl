(fn config []
  (let [nvim-lint (require :lint)]
    (tset nvim-lint.linters_by_ft :python ["ruff"])))

{: config}
