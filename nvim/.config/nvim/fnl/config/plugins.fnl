(local constants (require :config.constants))

(local specs [; plugin manager
              :folke/lazy.nvim
              ; nvim config and plugins in Fennel
              :Olical/aniseed
              ; Run Fennel inside Neovim on startup with Aniseed
              :Olical/nvim-local-fennel
              ; Display a popup with possible key bindings of the command you started ty
              :folke/which-key.nvim
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
              {1 :nvim-neotest/neotest
               :dependencies [:nvim-neotest/nvim-nio
                              :nvim-lua/plenary.nvim
                              :antoinemadec/FixCursorHold.nvim
                              :nvim-treesitter/nvim-treesitter]
               :config (. (require :config.plugin.neotest) :config)}
              :nvim-neotest/neotest-python
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
              ; LSP
              {1 :ray-x/lsp_signature.nvim
               :event :VeryLazy
               :opts {}
               :config (fn [_ opts] (let [lsp-signature (require :lsp_signature)] (lsp-signature.setup opts)))}
              ; {
              ;   "ray-x/lsp_signature.nvim",
              ;   event = "VeryLazy",
              ;   opts = {},
              ;   config = function(_, opts) require'lsp_signature'.setup(opts) end}

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
              {1 :mfussenegger/nvim-dap
               :dependencies [:rcarriga/nvim-dap-ui :nvim-neotest/nvim-nio]}
              {1 :rcarriga/nvim-dap-ui
               :dependencies [:nvim-neotest/nvim-nio]
               :config true}
              :jay-babu/mason-nvim-dap.nvim
              {1 :theHamsta/nvim-dap-virtual-text
               :dependencies [:mfussenegger/nvim-dap]
               :config true}
              {1 :leoluz/nvim-dap-go :config true}
              {1 :mfussenegger/nvim-dap-python
               :config (fn [] (let [dap-python (require :dap-python)]
                                (dap-python.setup "python")))}

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
              ;; Copilot
              ; :github/copilot.vim
              ;; Remote development
              {1 :amitds1997/remote-nvim.nvim
               :dependencies [:nvim-lua/plenary.nvim
                              :MunifTanjim/nui.nvim
                              :nvim-telescope/telescope.nvim]
               :config true}
              ;; Tmux
              :tmux-plugins/vim-tmux
              :christoomey/vim-tmux-navigator
              :edkolev/tmuxline.vim
              ;; UI: Theme and colorschemes
              {1 :nyoom-engineering/oxocarbon.nvim}
              :stevearc/dressing.nvim
              {1 :kosayoda/nvim-lightbulb
               :config (. (require :config.plugin.lightbulb) :config)}
              :marko-cerovac/material.nvim
              :rcarriga/nvim-notify
              ; Minimalist status/tabline for vim
              {1 :nvim-lualine/lualine.nvim
               :dependencies [:nvim-tree/nvim-web-devicons]}
              {1 :yamatsum/nvim-nonicons
               :dependencies [:nvim-tree/nvim-web-devicons]}
              {1 :rebelot/kanagawa.nvim
               :lazy false
               :priority 1000
               :opts {}
               :config (fn [] (vim.cmd "colorscheme kanagawa"))}
              ; {1 :folke/tokyonight.nvim
              ;  :lazy false
              ;  :priority 1000
              ;  :opts {}
              ;  :config (fn [] (vim.cmd "colorscheme tokyonight-storm"))}
               ; :config (fn [] (. (require :config.theme) :config))}
              :joshdick/onedark.vim
              :projekt0n/github-nvim-theme
              ; Trouble
              {1 :folke/trouble.nvim
               :opts {}
               :cmd :Trouble
               :dependencies [:nvim-tree/nvim-web-devicons]}])

(fn init []
  (let [lazy (require :lazy)]
    (lazy.setup specs))
  (let [config-theme (require :config.theme)
        config-cmp (require :config.plugin.cmp)
        mason (require :mason)
        mason-nvim-dap (require :config.plugin.mason-nvim-dap)]
    ;; Configure the UI theme
    (config-theme.config)
    ;; Configure the autocompletion
    (config-cmp.config)
    ;; Packages
    (mason.setup)
    ;; DAP
    (mason-nvim-dap.setup))
  ;; LSP
  (let [config-lsp (require :config.lsp.core)]
    (config-lsp.config)))

{: init}
