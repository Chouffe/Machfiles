(module config.keys.core
  {autoload {a aniseed.core
             nvim aniseed.nvim
             legendary legendary
             config-telescope config.plugin.telescope
             keys-leader config.keys.leader
             keys-mappings config.keys.mappings}})

(defn register []
  (legendary.setup)
  (keys-leader.register-keybindings)
  (keys-mappings.register-keybindings)
  (config-telescope.register-keybindings))
