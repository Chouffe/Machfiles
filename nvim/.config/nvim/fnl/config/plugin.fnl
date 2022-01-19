(module config.plugin
  {autoload {nvim aniseed.nvim
             constants config.constants
             a aniseed.core
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

(defn- setup [name]
  (string.format "require('plugins.%s').setup()" name))

(defn- config [name]
  (string.format "require('plugins.%s').config()" name))

(defn start []
  ; plugins managed by packer
  (use
    ; Plugin Manager
    :wbthomason/packer.nvim {}
    ; nvim config and plugins in Fennel
    :Olical/aniseed {:branch :develop}
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
    :tyru/open-browser.vim {:mod :open-browser}
    ; Display a popup with possible key bindings of the command you started ty
    :folke/which-key.nvim {:branch :main}
    ; vim over: :substitute preview
    :osyo-manga/vim-over {}
    ; Rainbow
    :luochen1990/rainbow {:mod :rainbow}

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
    :Olical/conjure {:branch :master :mod :conjure}
    :guns/vim-sexp {:mod :sexp}
    :tpope/vim-sexp-mappings-for-regular-people {}
    ; {:ft constants.lisp-filetypes}
    :eraserhd/parinfer-rust {:run "cargo build --release"}
    ; {:run "cargo build --release" :ft constants.lisp-filetypes}

    ; Fennel
    :bakpakin/fennel.vim {}

    ; Python
    :Vimjas/vim-python-pep8-indent {:ft :python}
    :psf/black {:ft :python}

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
    :nvim-telescope/telescope-fzf-native.nvim {:branch :main :run "make"}
    :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                               :nvim-lua/plenary.nvim]
                                    :mod :telescope}
    ; Treesitter: parsing system
    :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                      :mod :treesitter}
    ;; Language Server Protocol
    ; A collection of common configurations for Neovim's built in LSP
    :neovim/nvim-lspconfig {:mod :lspconfig}
    ; Adds the missing :LspInstall <language> command to conveniently install
    :williamboman/nvim-lsp-installer {}
    ; Autocomplete
    :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                  :hrsh7th/cmp-nvim-lsp
                                  :PaterJason/cmp-conjure]
                       :mod :cmp}


    ; Tmux
    :tmux-plugins/vim-tmux {}
    :christoomey/vim-tmux-navigator {}
    :edkolev/tmuxline.vim {}

    ; Colorschemes
    :morhetz/gruvbox {}
    :joshdick/onedark.vim {}
    :projekt0n/github-nvim-theme {:mod :theme}))
