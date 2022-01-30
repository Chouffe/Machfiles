(module config.plugins
  {autoload {nvim aniseed.nvim
             constants config.constants
             a aniseed.core
             packer packer}})

(defn- config [name]
  (string.format "require('config.plugin.%s').config()" name))

(def plugins
  { ; ====================================
   ; Plugin Manager
   :wbthomason/packer.nvim {}
   ; nvim config and plugins in Fennel
   :Olical/aniseed {:branch :develop}
   ; ====================================
   ; Comment out stuff
   :tpope/vim-commentary {}
   ; Readline style insertion
   :tpope/vim-rsi {}
   ; Heuristically set buffer options
   :tpope/vim-sleuth {}
   ; Helpers for Linux
   :tpope/vim-eunuch {}
   ; Defaults everyone can agree on
   :tpope/vim-sensible {}
   ; Expand region
   :terryma/vim-expand-region {}
   ; Pairs of handy bracket mapping
   :tpope/vim-unimpaired {}
   ; Asynchronous build and test dispatcher
   :tpope/vim-dispatch {}
   ; Project configuration
   :tpope/vim-projectionist {}
   ; Enable repeating supported plugin maps with '.'
   :tpope/vim-repeat {}
   ; Quoting/parenthesizing made simple
   :tpope/vim-surround {}
   ; Continuously updated session files (to be used with tmux resurect)
   :tpope/vim-obsession {}
   ; The fancy start screen for Vim
   :mhinz/vim-startify {}
   ; Align with ease
   :junegunn/vim-easy-align {}
   ; Provides yanking highlighting feedback
   :machakann/vim-highlightedyank {}
   ; Improved incremental searching
   :haya14busa/incsearch.vim {}
   ; Provides improved * motions
   :haya14busa/vim-asterisk {}
   ; Place, toggle and display marks.
   :kshenoy/vim-signature {}
   ; Open URI with your favorite browser - fix gx in nvim
   :tyru/open-browser.vim {:config (config :open-browser)}
   ; Display a popup with possible key bindings of the command you started ty
   :folke/which-key.nvim {:branch :main}
   ; vim over: :substitute preview
   :osyo-manga/vim-over {}
   ; Rainbow
   ; :luochen1990/rainbow {:mod :rainbow}

   ;; Objects and Motions
   ; Editing keys
   ; e for entire file
   ; i for indent level
   ; l for current line
   ; u for url
   ; b for any block type (parens, braces, quotes, ltgt)
   ; = and i= for conflicts marked blocks
   ; f for function (c, java, js, php, vim only)
   ; i,/a, for function parameter
   ; r for a block in ruby
   ; f,c for function and class in python
   ; c for css class
   ; :kana/vim-textobj-user {}
   ; :kana/vim-textobj-entire {}
   ; :kana/vim-textobj-indent {}
   ; :kana/vim-textobj-line {}
   ; :mattn/vim-textobj-url {}
   ; :rhysd/vim-textobj-anyblock {}
   ; :rhysd/vim-textobj-conflict {}
   ; :kana/vim-textobj-function {}
   ; :sgur/vim-textobj-parameter {}
   :thinca/vim-textobj-function-javascript {:ft :javascript}
   ; :nelstrom/vim-textobj-rubyblock {}
   :bps/vim-textobj-python {:ft :python}
   ; :jasonlong/vim-textobj-css {}

   ; Navigation
   :kyazdani42/nvim-tree.lua {:requires {:kyazdani42/nvim-web-devicons {}}
                              :config (config :nvim-tree)}
   ; :preservim/nerdtree {}

   ; Neomake
   :neomake/neomake {}

   ; Clojure
   :Olical/conjure {:branch :master
                    :config (config :conjure)}
   :guns/vim-sexp {:ft constants.lisp-filetypes
                   :config (config :sexp)}
   :tpope/vim-sexp-mappings-for-regular-people {:ft constants.lisp-filetypes}
   :eraserhd/parinfer-rust {:ft constants.lisp-filetypes
                            :run "cargo build --release"}

   ; Fennel
   :bakpakin/fennel.vim {}

   ; Python
   :Vimjas/vim-python-pep8-indent {:ft :python}
   :psf/black {:ft :python
               :config (config :black)}

   ; FZF
   :junegunn/fzf {:run "./install --all"
                  :requires {:junegunn/fzf.vim {}
                             :tweekmonster/fzf-filemru {}}}

   ; Git
   :tpope/vim-fugitive {}
   :tpope/vim-rhubarb {}
   :airblade/vim-gitgutter {}
   :mhinz/vim-signify {}
   :lambdalisue/vim-gita {}

   ; Minimalist status/tabline for vim
   :itchyny/lightline.vim {}

   ; Telescope: file searching
   :nvim-telescope/telescope.nvim {:requires {:nvim-telescope/telescope-file-browser.nvim {}
                                              :nvim-telescope/telescope-fzf-native.nvim {:branch :main :run "make"}
                                              ; :xiyaowong/telescope-emoji.nvim {}
                                              :nvim-lua/popup.nvim {}
                                              :nvim-lua/plenary.nvim {}}
                                   :config (config :telescope)}

    ; Treesitter: parsing system
    :nvim-treesitter/nvim-treesitter {:requires {:p00f/nvim-ts-rainbow {}}
                                      :run ":TSUpdate"
                                      :config (config :treesitter)}

    ;; Language Server Protocol
    ; A collection of common configurations for Neovim's built in LSP
    :neovim/nvim-lspconfig {:config (config :lspconfig)}
    ; Adds the missing :LspInstall <language> command to conveniently install
    :williamboman/nvim-lsp-installer {}
    ; Autocomplete
    :hrsh7th/nvim-cmp {:requires {:hrsh7th/cmp-buffer {}
                                  :hrsh7th/cmp-nvim-lsp {}
                                  :PaterJason/cmp-conjure {}
                                  :andersevenrud/cmp-tmux {}
                                  :lukas-reineke/cmp-rg {}
                                  :hrsh7th/cmp-path {}
                                  :hrsh7th/cmp-cmdline {}
                                  :hrsh7th/nvim-cmp {}
                                  ;; Provides icons for cmp
                                  :onsails/lspkind-nvim {}}
                       :config (config :cmp)}
    ; A tree like view for symbols using LSP
    :simrat39/symbols-outline.nvim {:config (config :symbols-outline)}
    :kosayoda/nvim-lightbulb {:config (config :lightbulb)}

    ; Tmux
    :tmux-plugins/vim-tmux {}
    :christoomey/vim-tmux-navigator {}
    :edkolev/tmuxline.vim {}

    ; Colorschemes
    ;; Checkout: https://github.com/kyazdani42/nvim-tree.lua
    :yamatsum/nvim-nonicons {:requires {:kyazdani42/nvim-web-devicons  {}}}
    :morhetz/gruvbox {:config (config :theme)}
    :joshdick/onedark.vim {}
    :projekt0n/github-nvim-theme {}})

(defn- log [x]
  (a.println x))

(defn- pair-to-plugin [[name opts]]
  (a.assoc opts 1 name))

(defn- adapt-requires [opts]
  (if opts.requires
    (a.update opts :requires (partial a.map-indexed pair-to-plugin))
    opts))

(defn- adapt-plugin [[name opts]]
  (pair-to-plugin [name (adapt-requires opts)]))

(defn- adapt-plugins [plugins]
  (a.map-indexed adapt-plugin plugins))

(defn- use-all [plugins]
  (each [_ plugin (ipairs (adapt-plugins plugins))]
    (packer.use plugin)))

(defn init []
  (packer.init {:max_jobs 50})
  (use-all plugins))
