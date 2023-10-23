-- Entrypoint for my Neovim configuration!
-- We simply bootstrap packer and Aniseed here.
-- It's then up to Aniseed to compile and load fnl/config/init.fnl

local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local packages_path = vim.fn.stdpath("data") .. "/lazy"

---@param name string
---@param alias string?
local function install_package(name, alias)
  ---@type unknown, unknown, string, string
  local _, _, owner, repo = name:find([[(.+)/(.+)]])
  local path = ("%s/%s"):format(packages_path, alias or repo)

  if not vim.loop.fs_stat(path) then
    vim.notify(("Installing %s/%s..."):format(owner, repo), vim.log.levels.INFO)

    local command = {
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      ("https://github.com/%s/%s.git"):format(owner, repo),
      path,
    }

    vim.fn.system(command)
  end

  vim.opt.runtimepath:prepend(path)
end

install_package("folke/lazy.nvim")
install_package("Olical/aniseed")

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
vim.g["aniseed#env"] = {
  module = "config.init",
  compile = true
}

-- Source viml config files
vim.cmd [[ source ~/.config/nvim/viml/init.vim ]]
