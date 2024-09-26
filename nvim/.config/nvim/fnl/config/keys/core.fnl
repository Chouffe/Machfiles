(fn register []
  (let [keys-leader (require :config.keys.leader)
        keys-mappings (require :config.keys.mappings)
        config-telescope (require :config.plugin.telescope)]
    (keys-leader.register-keybindings)
    (keys-mappings.register-keybindings)
    (config-telescope.register-keybindings)))

{: register}
