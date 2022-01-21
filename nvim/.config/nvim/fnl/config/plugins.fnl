(module config.plugins
  {autoload {nvim aniseed.nvim
             constants config.constants
             a aniseed.core
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok-require? val-or-err-require)
        (pcall require (.. :config.plugin. name))]
    (if (not ok-require?)
      (print (.. "config error: " val-or-err-require))
      (let [(ok? val-or-err) (pcall val-or-err-require.config)]
        (when (not ok?)
          (print (.. "config error: " val-or-err)))))))

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
   :tyru/open-browser.vim {:config #(let [open-browser (require :config.plugin.open-browser)]
                                      (open-browser.config))}
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
   :kana/vim-textobj-user {}
   :kana/vim-textobj-entire {}
   :kana/vim-textobj-indent {}
   :kana/vim-textobj-line {}
   :mattn/vim-textobj-url {}
   :rhysd/vim-textobj-anyblock {}
   :rhysd/vim-textobj-conflict {}
   :kana/vim-textobj-function {}
   :sgur/vim-textobj-parameter {}
   :thinca/vim-textobj-function-javascript {}
   :nelstrom/vim-textobj-rubyblock {}
   :bps/vim-textobj-python {}
   :jasonlong/vim-textobj-css {}

   ; Navigation
   :preservim/nerdtree {}

   ; Neomake
   :neomake/neomake {}

   ; Clojure
   :Olical/conjure {:branch :master :config #(let [conjure (require :config.plugin.conjure)]
                                               (conjure.config))}
   :guns/vim-sexp {:ft "clojure"}
   :tpope/vim-sexp-mappings-for-regular-people {}
   :eraserhd/parinfer-rust {:run "cargo build --release"}

   ; Fennel
   :bakpakin/fennel.vim {}

   ; Python
   :Vimjas/vim-python-pep8-indent {:ft "python"}
   :psf/black {:ft "python" :config #(let [black (require :config.plugin.black)]
                                       (black.config))}

   ; FZF
   :junegunn/fzf {:run "./install --all"}
   :junegunn/fzf.vim {}
   :tweekmonster/fzf-filemru {}

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
                                              :nvim-lua/popup.nvim {}
                                              :nvim-lua/plenary.nvim {}}
                                   :config #(let [telescope (require :config.plugin.telescope)]
                                              (telescope.config))}


    ; Treesitter: parsing system
    :nvim-treesitter/nvim-treesitter {:requires {:p00f/nvim-ts-rainbow {}}
                                      :run ":TSUpdate"
                                      :config #(let [treesitter (require :config.plugin.treesitter)]
                                                 (treesitter.config))}

    ;; Language Server Protocol
    ; A collection of common configurations for Neovim's built in LSP
    :neovim/nvim-lspconfig {:config #(let [lspconfig (require :config.plugin.lspconfig)]
                                       (lspconfig.config))}
    ; Adds the missing :LspInstall <language> command to conveniently install
    :williamboman/nvim-lsp-installer {}
    ; Autocomplete
    :hrsh7th/nvim-cmp {:requires {:hrsh7th/cmp-buffer {}
                                   :hrsh7th/cmp-nvim-lsp {}
                                   :PaterJason/cmp-conjure {}}
                       :config #(let [cmp (require :config.plugin.cmp)]
                                  (cmp.config))}

   ; Tmux
   :tmux-plugins/vim-tmux {}
   :christoomey/vim-tmux-navigator {}
   :edkolev/tmuxline.vim {}

   ; Colorschemes
   :kyazdani42/nvim-web-devicons {}
   :morhetz/gruvbox {:config #(let [theme (require :config.plugin.theme)]
                                (theme.config))}
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
