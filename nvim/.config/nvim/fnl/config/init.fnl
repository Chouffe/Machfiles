(module config.init)

(fn init! []
  (let [plugins (require :config.plugins)
        autocommands (require :config.general.autocommands)
        user-commands (require :config.general.user_commands)
        keys (require :config.keys.core)
        debugging (require :config.debugging)
        diagnostics (require :config.diagnostics)]
    (plugins.init)
    (autocommands.setup)
    (user-commands.setup)
    (keys.register)
    (debugging.setup)
    (diagnostics.setup)))

(init!)
