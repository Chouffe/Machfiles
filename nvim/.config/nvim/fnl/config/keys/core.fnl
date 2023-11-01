(fn register []
  (let [legendary (require :legendary)
        keys-leader (require :config.keys.leader)
        keys-mappings (require :config.keys.mappings)
        config-telescope (require :config.plugin.telescope)]
    (legendary.setup)
    (keys-leader.register-keybindings)
    (keys-mappings.register-keybindings)
    (config-telescope.register-keybindings)))

{: register}
