local _2afile_2a = "/home/chouffe/.config/nvim/fnl/config/plugin.fnl"
local _2amodule_name_2a = "config.plugin"
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
local a, nvim, packer, util = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("packer"), autoload("config.util")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["packer"] = packer
_2amodule_locals_2a["util"] = util
local function safe_require_plugin_config(name)
  local ok_3f, val_or_err = pcall(require, ("config.plugin." .. name))
  if not ok_3f then
    return print(("config error: " .. val_or_err))
  else
    return nil
  end
end
_2amodule_locals_2a["safe-require-plugin-config"] = safe_require_plugin_config
local function use(...)
  do
    local pkgs = {...}
    local function _2_(use0)
      for i = 1, a.count(pkgs), 2 do
        local name = pkgs[i]
        local opts = pkgs[(i + 1)]
        do
          local _3_ = opts.mod
          if (nil ~= _3_) then
            safe_require_plugin_config(_3_)
          else
          end
        end
        use0(a.assoc(opts, 1, name))
      end
      return nil
    end
    packer.startup(_2_)
  end
  return nil
end
_2amodule_locals_2a["use"] = use
return use("wbthomason/packer.nvim", {}, "Olical/aniseed", {branch = "develop"}, "tpope/vim-commentary", {}, "tpope/vim-rsi", {}, "tpope/vim-sleuth", {}, "tpope/vim-eunuch", {}, "tpope/vim-sensible", {}, "terryma/vim-expand-region", {}, "tpope/vim-unimpaired", {}, "tpope/vim-dispatch", {}, "tpope/vim-projectionist", {}, "tpope/vim-repeat", {}, "tpope/vim-surround", {}, "tpope/vim-obsession", {}, "mhinz/vim-startify", {}, "junegunn/vim-easy-align", {}, "machakann/vim-highlightedyank", {}, "haya14busa/incsearch.vim", {}, "haya14busa/vim-asterisk", {}, "kshenoy/vim-signature", {}, "tyru/open-browser.vim", {}, "folke/which-key.nvim", {branch = "main"}, "osyo-manga/vim-over", {}, "kana/vim-textobj-user", {}, "kana/vim-textobj-entire", {}, "kana/vim-textobj-indent", {}, "kana/vim-textobj-line", {}, "mattn/vim-textobj-url", {}, "rhysd/vim-textobj-anyblock", {}, "rhysd/vim-textobj-conflict", {}, "kana/vim-textobj-function", {}, "sgur/vim-textobj-parameter", {}, "thinca/vim-textobj-function-javascript", {}, "nelstrom/vim-textobj-rubyblock", {}, "bps/vim-textobj-python", {}, "jasonlong/vim-textobj-css", {}, "preservim/nerdtree", {}, "neomake/neomake", {}, "Olical/conjure", {branch = "master", mod = "conjure"}, "guns/vim-sexp", {}, "tpope/vim-sexp-mappings-for-regular-people", {ft = "clojure"}, "eraserhd/parinfer-rust", {run = "cargo build --release", ft = "clojure"}, "Vimjas/vim-python-pep8-indent", {ft = "python"}, "psf/black", {ft = "python"}, "junegunn/fzf", {run = "./install --all"}, "junegunn/fzf.vim", {}, "tweekmonster/fzf-filemru", {}, "tpope/vim-fugitive", {}, "tpope/vim-rhubarb", {}, "airblade/vim-gitgutter", {}, "mhinz/vim-signify", {}, "lambdalisue/vim-gita", {}, "itchyny/lightline.vim", {}, "nvim-telescope/telescope-fzf-native.nvim", {branch = "main", run = "make"}, "nvim-telescope/telescope.nvim", {requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, mod = "telescope"}, "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate", mod = "treesitter"}, "neovim/nvim-lspconfig", {mod = "lspconfig"}, "williamboman/nvim-lsp-installer", {}, "hrsh7th/nvim-cmp", {requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "PaterJason/cmp-conjure"}, mod = "cmp"}, "tmux-plugins/vim-tmux", {}, "christoomey/vim-tmux-navigator", {}, "edkolev/tmuxline.vim", {}, "morhetz/gruvbox", {}, "joshdick/onedark.vim", {}, "projekt0n/github-nvim-theme", {mod = "theme"})