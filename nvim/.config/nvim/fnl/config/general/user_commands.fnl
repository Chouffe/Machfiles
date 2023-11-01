(fn setup []
  (let [nvim (require :aniseed.nvim)
        functions (require :config.general.functions)]
    (nvim.create_user_command
      "ToggleHiglightAtColorColumn"
      functions.toggle-highlight-at-colorcolumn
      {:nargs "*"
       :desc "Toggles highlight at colorcolumn"})
    (nvim.create_user_command
      "ParinferToggle"
      functions.toggle-parinfer
      {:nargs "*"
       :desc "Toggles Parinfer"})))

{: setup}
