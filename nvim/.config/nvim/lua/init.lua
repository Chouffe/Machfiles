local _2afile_2a = "/home/chouffe/.config/nvim/fnl/init.fnl"
local _2amodule_name_2a = "init"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
require("dotfiles.general.functions")
require("dotfiles.general.autocommands")
require("dotfiles.config.plugins.aniseed")
require("dotfiles.config.plugins.telescope")
require("dotfiles.config.plugins.open-browser")
require("dotfiles.config.plugins.rainbow-parentheses")
return require("dotfiles.config.lsp.clojure")