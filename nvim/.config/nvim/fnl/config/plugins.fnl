(local constants (require :config.constants))

(local specs [; plugin manager
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
              {1 :tyru/open-browser.vim
               :config (. (require :config.plugin.open-browser) :config)}
              ; Display a popup with possible key bindings of the command you started ty
              :folke/which-key.nvim
              ; Define your keymaps, commands, and autocommands as simple Lua tables, building a legend at the same time.
              :mrjones2014/legendary.nvim
              ; vim over: :substitute preview
              :osyo-manga/vim-over
              ; Motion plugin for neovim
              :ggandor/lightspeed.nvim
              ; Highlight automatically other uses of the word under the cursor
              {1 :RRethy/vim-illuminate
               :config (. (require :config.plugin.illuminate) :config)}
              ;; Packages
              :williamboman/mason.nvim
              :williamboman/mason-lspconfig.nvim
              :neovim/nvim-lspconfig
              {1 :j-hui/fidget.nvim
               :config (. (require :config.plugin.fidget-nvim) :config)}
              ; Filesystem Navigation
              ; {1 :kyazdani42/nvim-tree.lua
              ;  :dependencies [:kyazdani42/nvim-web-devicons]
              ;  :config config-nvim-tree.config}
              {1 :kyazdani42/nvim-tree.lua
               ; :dependencies [:kyazdani42/nvim-web-devicons]
               :dependencies [:nvim-tree/nvim-web-devicons]
               :config (. (require :config.plugin.nvim-tree) :config)}
              {1 :junegunn/fzf
               :build "./install --all"
               :dependencies [:ibhagwan/fzf-lua
                              :junegunn/fzf.vim
                              :tweekmonster/fzf-filemru]}
              {1 :nvim-telescope/telescope.nvim
               :config (. (require :config.plugin.telescope) :config)
               :dependencies [:nvim-lua/plenary.nvim
                              :nvim-telescope/telescope-symbols.nvim
                              :nvim-telescope/telescope-ui-select.nvim
                              :nvim-lua/popup.nvim
                              {1 :nvim-telescope/telescope-fzf-native.nvim
                               :build :make}]
               :tag :0.1.4}
              ; Hugo
              :phelipetls/vim-hugo
              ; Clojure
              {1 :Olical/conjure
               :config (. (require :config.plugin.conjure) :config)}
              ; {1 :guns/vim-sexp
              ;  :dependencies [:folke/which-key.nvim]
              ;  :config config-sexp.config}
              {1 :guns/vim-sexp
               :config (. (require :config.plugin.sexp) :config)}
              :tpope/vim-sexp-mappings-for-regular-people
              {1 :eraserhd/parinfer-rust
               :build "cargo build --release"
               :ft constants.lisp-filetypes}
              ; Fennel
              :bakpakin/fennel.vim
              ; Grammar parsing
              {1 :nvim-treesitter/nvim-treesitter
               :build ":TSUpdate"
               :dependencies [:HiPhish/rainbow-delimiters.nvim
                              :windwp/nvim-ts-autotag]
               :config (. (require :config.plugin.treesitter) :config)}
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
                              :hrsh7th/cmp-nvim-lsp-signature-help
                              :onsails/lspkind-nvim]}
              ;; Dap
              ;; :mfussenegger/nvim-dap
              ;; {1 :mfussenegger/nvim-dap-python
              ;;  :ft :python
              ;;  :config (fn [_ _]
              ;;            (let [path :/home/chouffe/miniconda3/envs/debugpy
              ;;                  dap-python (require :dap-python)]
              ;;              (dap-python.setup path)))
              ;;  :dependencies [:mfussenegger/nvim-dap]}
              ;; Linting and formatting
              {1 :nvimtools/none-ls.nvim
               :dependencies [:nvim-lua/plenary.nvim]
               :config (. (require :config.plugin.null-ls) :config)}
              {1 :jay-babu/mason-null-ls.nvim
               :event [:bufreadpre :bufnewfile]
               :dependencies [:williamboman/mason.nvim :nvimtools/none-ls.nvim]
               :config (. (require :config.plugin.mason-null-ls) :config)}
              ;; Git
              :tpope/vim-fugitive
              :tpope/vim-rhubarb
              :airblade/vim-gitgutter
              :mhinz/vim-signify
              :lambdalisue/vim-gita
              {1 :NeogitOrg/neogit
               :dependencies [:nvim-lua/plenary.nvim
                              :sindrets/diffview.nvim
                              :nvim-telescope/telescope.nvim]
               :config true}
              ;; Tmux
              :tmux-plugins/vim-tmux
              :christoomey/vim-tmux-navigator
              :edkolev/tmuxline.vim
              ;; UI: Theme and colorschemes
              :stevearc/dressing.nvim
              {1 :kosayoda/nvim-lightbulb
               :config (. (require :config.plugin.lightbulb) :config)}
              :marko-cerovac/material.nvim
              ; Minimalist status/tabline for vim
              {1 :nvim-lualine/lualine.nvim
               ; :dependencies [:kyazdani42/nvim-web-devicons]
               :dependencies [:nvim-tree/nvim-web-devicons]}
              {1 :yamatsum/nvim-nonicons
               ; :dependencies [:kyazdani42/nvim-web-devicons]
               :dependencies [:nvim-tree/nvim-web-devicons]}
              {1 :folke/trouble.nvim
               :dependencies [:nvim-tree/nvim-web-devicons]}
              {1 :folke/tokyonight.nvim :lazy false :priority 1000 :opts {}}
              :joshdick/onedark.vim
              :projekt0n/github-nvim-theme])

(fn init []
  (let [lazy (require :lazy)]
    (lazy.setup specs))
  (let [config-theme (require :config.theme)
        config-cmp (require :config.plugin.cmp)
        mason (require :mason)]
    ;; Configure the UI theme
    (config-theme.config)
    ;; Configure the autocompletion
    (config-cmp.config)
    ;; Packages
    (mason.setup))
  ;; LSP
  (let [config-lsp (require :config.lsp.core)]
    (config-lsp.config)))

{: init}
