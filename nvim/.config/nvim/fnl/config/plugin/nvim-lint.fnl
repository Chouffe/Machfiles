(fn config []
  (let [nvim-lint (require :lint)]
    (comment
      (tset nvim-lint.linters_by_ft :python ["ruff"]))))

{: config}
