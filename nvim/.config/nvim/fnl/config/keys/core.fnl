(fn register []
  (let [keys-leader (require :config.keys.leader)
        keys-mappings (require :config.keys.mappings)
        config-telescope (require :config.plugin.telescope)
        config-barbar (require :config.plugin.barbar)]
    (keys-leader.register-keybindings)
    (keys-mappings.register-keybindings)
    (config-barbar.register-keybindings)
    (config-telescope.register-keybindings)))

{: register}
