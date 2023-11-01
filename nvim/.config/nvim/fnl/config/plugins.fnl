(module config.plugins
  {autoload {nvim aniseed.nvim
             constants config.constants
             a aniseed.core

             ; Package Managers
             lazy lazy
             mason mason
             
             config-lsp config.lsp.core
             config-lightbulb config.plugin.lightbulb
             config-neomake config.plugin.neomake
             config-telescope config.plugin.telescope
             config-treesitter config.plugin.treesitter}})

(local specs 
  [
   ; plugin manager
   :folke/lazy.nvim
   ; nvim config and plugins in Fennel
   :Olical/aniseed 
   ; Run Fennel inside Neovim on startup with Aniseed
   :Olical/nvim-local-fennel
   ; Display a popup with possible key bindings of the command you started ty
   :folke/which-key.nvim
   ; Comment out stuff
   :tpope/vim-commentary
   ; Readline style insertion
   :tpope/vim-rsi
   ; Heuristically set buffer options
   :tpope/vim-sleuth
   ; Helpers for Linux
   :tpope/vim-eunuch
   ; Defaults everyone can agree on
   :tpope/vim-sensible
   ; Expand region
   :terryma/vim-expand-region
   ; Pairs of handy bracket mapping
   :tpope/vim-unimpaired
   ; Asynchronous build and test dispatcher
   :tpope/vim-dispatch
   ; Project configuration
   :tpope/vim-projectionist
   ; Enable repeating supported plugin maps with '.'
   :tpope/vim-repeat
   ; Quoting/parenthesizing made simple
   :tpope/vim-surround
   ; Continuously updated session files (to be used with tmux resurect)
   :tpope/vim-obsession
   ; The fancy start screen for Vim
   :mhinz/vim-startify
   ; Align with ease
   :junegunn/vim-easy-align
   ; Yanking highlighting feedback
   :machakann/vim-highlightedyank
   ; Improved incremental searching
   :haya14busa/incsearch.vim
   ; Improved * motions
   :haya14busa/vim-asterisk
   ; Place, toggle and display marks.
   :kshenoy/vim-signature
   ; Open URI with your favorite browser - fix gx in nvim
   {1 :tyru/open-browser.vim :config (. (require :config.plugin.open-browser) :config)}
   ; Display a popup with possible key bindings of the command you started ty
   :folke/which-key.nvim
   ; Define your keymaps, commands, and autocommands as simple Lua tables, building a legend at the same time.
   :mrjones2014/legendary.nvim
   ; vim over: :substitute preview
   :osyo-manga/vim-over
   ; Motion plugin for neovim
   :ggandor/lightspeed.nvim
   ; Highlight automatically other uses of the word under the cursor
   {1 :RRethy/vim-illuminate :config (. (require :config.plugin.illuminate) :config)}
                                       

   ;; Packages
   :williamboman/mason.nvim
   :williamboman/mason-lspconfig.nvim
   :neovim/nvim-lspconfig

   ; Filesystem Navigation
   ; {1 :kyazdani42/nvim-tree.lua 
   ;  :dependencies [:kyazdani42/nvim-web-devicons]
   ;  :config config-nvim-tree.config}
   {1 :kyazdani42/nvim-tree.lua 
    :dependencies [:kyazdani42/nvim-web-devicons]
    :config (. (require :config.plugin.nvim-tree) :config)}
   {1 :junegunn/fzf 
    :build "./install --all" 
    :dependencies [:ibhagwan/fzf-lua 
                   :junegunn/fzf.vim 
                   :tweekmonster/fzf-filemru]}
   {1 :nvim-telescope/telescope.nvim
    :dependencies [:nvim-lua/plenary.nvim
                   :nvim-telescope/telescope-symbols.nvim
                   :nvim-telescope/telescope-ui-select.nvim
                   :nvim-lua/popup.nvim
                   {1 :nvim-telescope/telescope-fzf-native.nvim :build "make"}]

    :tag "0.1.4"}

   ; Clojure
   {1 :Olical/conjure :config (. (require :config.plugin.conjure) :config)}
   ; {1 :guns/vim-sexp 
   ;  :dependencies [:folke/which-key.nvim] 
   ;  :config config-sexp.config}
   {1 :guns/vim-sexp :config (. (require :config.plugin.sexp) :config)}
   :tpope/vim-sexp-mappings-for-regular-people
   {1 :eraserhd/parinfer-rust 
    :build "cargo build --release" 
    :ft constants.lisp-filetypes}

   ; Fennel
   :bakpakin/fennel.vim

   ; Grammar parsing
   {1 :nvim-treesitter/nvim-treesitter
    :build ":TSUpdate"
    :dependencies [:HiPhish/rainbow-delimiters.nvim]
    :config config-treesitter.config}

   ; Autocomplete
   {1 :hrsh7th/nvim-cmp
    :dependencies [:hrsh7th/cmp-buffer
                   :hrsh7th/cmp-nvim-lsp
                   :PaterJason/cmp-conjure
                   :andersevenrud/cmp-tmux
                   :lukas-reineke/cmp-rg
                   :hrsh7th/cmp-path
                   :hrsh7th/cmp-cmdline
                   :hrsh7th/cmp-nvim-lua
                   :onsails/lspkind-nvim]}

   ;; Git
   :tpope/vim-fugitive
   :tpope/vim-rhubarb 
   :airblade/vim-gitgutter
   :mhinz/vim-signify
   :lambdalisue/vim-gita
   
   ;; Tmux
   :tmux-plugins/vim-tmux
   :christoomey/vim-tmux-navigator
   :edkolev/tmuxline.vim
   
   ;; UI: Theme and colorschemes
   :stevearc/dressing.nvim
   {1 :kosayoda/nvim-lightbulb :config config-lightbulb.config}
   :marko-cerovac/material.nvim
   ; Minimalist status/tabline for vim
   {1 :nvim-lualine/lualine.nvim
    :dependencies [:kyazdani42/nvim-web-devicons]}
   {1 :yamatsum/nvim-nonicons
    :dependencies [:kyazdani42/nvim-web-devicons]}
   {1 :folke/trouble.nvim 
    :dependencies [:nvim-tree/nvim-web-devicons]}
   {1 :folke/tokyonight.nvim
    :lazy false
    :priority 1000
    :opts {}}
   :joshdick/onedark.vim
   :projekt0n/github-nvim-theme])


(defn init []
  (lazy.setup specs)
  ;; Configure the UI theme
  (local config-theme (require :config.theme))
  (config-theme.config)
  ; (config-theme.config)
  ;; Configure the autocompletion
  (local config-cmp (require :config.plugin.cmp))
  (config-cmp.config)
  ; (config-cmp.config)
  ;; Packages
  (mason.setup)

  ;; LSP
  (config-lsp.config))
