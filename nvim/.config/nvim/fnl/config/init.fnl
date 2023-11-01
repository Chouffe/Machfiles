(module config.init)

(fn init! []
  (let [plugins (require :config.plugins)
        autocommands (require :config.general.autocommands)
        user-commands (require :config.general.user_commands)
        keys (require :config.keys.core)]
    (plugins.init)
    (autocommands.setup)
    (user-commands.setup)
    (keys.register)))

(init!)
