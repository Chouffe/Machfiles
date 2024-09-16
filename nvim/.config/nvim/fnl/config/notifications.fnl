(fn setup []
  (let [nvim (require :aniseed.nvim)
        notify (require :notify)]
    (set nvim.notify notify)))

{: setup}
