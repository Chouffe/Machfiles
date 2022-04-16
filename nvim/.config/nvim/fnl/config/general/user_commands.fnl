(module config.general.user_commands
  {autoload {nvim conjure.aniseed.nvim
             functions config.general.functions}})

(defn setup []
  (nvim.create_user_command
    "ToggleHiglightAtColorColumn"
    functions.toggle-highlight-at-colorcolumn
    {:nargs "*"
     :desc "Toggles highlight at colorcolumn"})
  (nvim.create_user_command
    "ParinferToggle"
    functions.toggle-parinfer
    {:nargs "*"
     :desc "Toggles Parinfer"}))
