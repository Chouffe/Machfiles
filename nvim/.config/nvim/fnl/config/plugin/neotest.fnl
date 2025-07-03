(fn config []
  (let [neotest (require :neotest)
        neotest-python (require :neotest-python)]
    (neotest.setup {:adapters [(neotest-python {:dap {:justMyCode false}
                                                ; :args ["--reuse-db" "--ds" "test_scripts.unittest_settings"]
                                                :args []
                                                :runner "pytest"})]})))

{: config}
