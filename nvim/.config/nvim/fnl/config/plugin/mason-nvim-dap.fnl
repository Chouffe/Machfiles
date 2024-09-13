(fn setup []
  (let [mason-nvim-dap (require :mason-nvim-dap)]
    (mason-nvim-dap.setup {:ensure_installed [:python :delve]})))

{: setup}
