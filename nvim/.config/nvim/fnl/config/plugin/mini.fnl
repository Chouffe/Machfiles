(fn config []
  (let [mini-ai (require :mini.ai)
        mini-surround (require :mini.surround)
        mini-pairs (require :mini.pairs)
        mini-bracketed (require :mini.bracketed)
        mini-files (require :mini.files)]
    (mini-ai.setup)
    (mini-surround.setup)
    (mini-pairs.setup)
    (mini-bracketed.setup)
    (mini-files.setup)))

{: config}

