local _2afile_2a = "/home/chouffe/.config/nvim/fnl/config/plugins/telescope.fnl"
local _2amodule_name_2a = "config.plugins.telescope"
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
local autoload = (require("aniseed.autoload")).autoload
local actions, telescope = autoload("telescope.actions"), autoload("telescope")
do end (_2amodule_locals_2a)["actions"] = actions
_2amodule_locals_2a["telescope"] = telescope
telescope.load_extension("fzf")
return telescope.setup({defaults = {mappings = {i = {["<esc>"] = actions.close}}}})