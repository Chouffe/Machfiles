(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string
             autocommands config.general.autocommands
             user-commands config.general.user_commands
             keys-leader config.keys.leader
             plugins config.plugins}})

;generic mapping leaders configuration
; (nvim.set_keymap :n :<space> :<nop> {:noremap true})
; (set nvim.g.mapleader " ")
; (set nvim.g.maplocalleader ",")

;don't wrap lines
; (nvim.ex.set :nowrap)

;sets a nvim global options
;(let [options
;      {;settings needed for compe autocompletion
;       :completeopt "menuone,noselect"
;       ;case insensitive search
;       :ignorecase true
;       ;smart search case
;       :smartcase true
;       ;shared clipboard with linux
;       :clipboard "unnamedplus"}]
;  (each [option value (pairs options)]
;    (core.assoc nvim.o option value)))

(defn- init! []
 (plugins.init)
 (autocommands.setup)
 (user-commands.setup)
 (keys-leader.register-keybindings))

(init!)
