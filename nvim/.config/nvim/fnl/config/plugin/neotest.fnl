(fn config []
  (let [neotest (require :neotest)
        neotest-python (require :neotest-python)]
    (neotest.setup {:adapters [neotest-python]})))

{: config}
