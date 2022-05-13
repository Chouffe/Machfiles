(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string
             autocommands config.general.autocommands
             user-commands config.general.user_commands
             keys config.keys.core
             keys-leader config.keys.leader
             keys-other config.keys.mappings
             plugins config.plugins}})

(defn- init! []
 (plugins.init)
 (autocommands.setup)
 (user-commands.setup)
 (keys.register))

(init!)
