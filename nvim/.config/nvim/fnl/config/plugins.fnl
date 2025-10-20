(local constants (require :config.constants))

(local specs [; plugin manager
              :folke/lazy.nvim
              ; A collection of small QoL plugins for Neovim.
              {1 :folke/snacks.nvim
               :priority 1000
               :lazy false
               :dependencies [:echasnovski/mini.icons :kyazdani42/nvim-web-devicons]
               :opts {:bigfile {:enable true}
                      :dashboard {:enabled true :example "compact_files"}
                      :explorer {:enable true}
                      :gitbrowse {:enable true}
                      :indent {:enable true}
                      :input {:enable true}
                      :picker {:enable true}
                      :notifier {:enable true}
                      :quickfile {:enable true}
                      :rename {:enable true}
                      :scope {:enable true}
                      :scroll {:enable true}
                      :statuscolumn {:enable true}
                      :toggle {:enable true}
                      :words {:enable true}}}
              ; Library of 40+ independent Lua modules
              {1 :echasnovski/mini.nvim
               :version false
               :config (. (require :config.plugin.mini) :config)}
              ; nvim config and plugins in Fennel
              :Olical/aniseed
              ; Run Fennel inside Neovim on startup with Aniseed
              :Olical/nvim-local-fennel
              ; Display a popup with possible key bindings of the command you started ty
              {1 :folke/which-key.nvim
               :dependencies [:echasnovski/mini.icons :kyazdani42/nvim-web-devicons]
               :opts {:preset :helix}}
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
              ; replaced by mini.nvim
              ; :tpope/vim-unimpaired
              ; Asynchronous build and test dispatcher
              :tpope/vim-dispatch
              ; Harpoon
              {1 :ThePrimeagen/harpoon
               :branch "harpoon2"
               :dependencies [:nvim-lua/plenary.nvim]
               :config (. (require :config.plugin.harpoon) :config)}

              ; Task runner
              {1 :stevearc/overseer.nvim
               :config true}
              ; Neotest
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
              ; Replaced by mini.surround
              ; :tpope/vim-surround
              ; Continuously updated session files (to be used with tmux resurect)
              :tpope/vim-obsession
              ; The fancy start screen for Vim
              ; :mhinz/vim-startify
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
              ; plugin that completely replaces the UI for messages, cmdline and the popupmenu.
              {1 :folke/noice.nvim
               :event :VeryLazy
               :dependencies [:MunifTanjim/nui.nvim :rcarriga/nvim-notify]
               :config (. (require :config.plugin.noice) :config)}
              {1 :folke/todo-comments.nvim
               :dependencies [:nvim-lua/plenary.nvim]
               :config #(let [todo-comments (require :todo-comments)]
                          (todo-comments.setup {}))}
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
              ; AI
              ; {1 :olimorris/codecompanion.nvim
              ;  :opts {:strategies
              ;         {:chat {:adapter :openai
              ;                 :opts {:completion_provider :cmp}}
              ;          :inline {:adapter :openai
              ;                   :keymaps {:accept_change {:modes {:n "ga"} :description "Accept the suggested change"}
              ;                             :reject_change {:modes {:n "gr"} :description "Reject the suggested change"}}}
              ;          :cmd {:adapter :openai}}}
              ;  :dependencies [:nvim-lua/plenary.nvim
              ;                 :nvim-treesitter/nvim-treesitter
              ;                 {1 :MeanderingProgrammer/render-markdown.nvim :ft [:markdown :codecompanion]}
              ;                 ; {1 :OXY2DEV/markview.nvim :lazy false :opts {:preview {:filetypes [:markdown :codecompanion] :ignore_buftypes []}}}
              ;                 {1 :echasnovski/mini.diff :config (fn [] (let [diff (require :mini.diff)]
              ;                                                            (diff.setup {:source (diff.gen_source.none)})))}]}
              {1 :yetone/avante.nvim
               :event :VeryLazy
               :version false
               :opts {:provider :openai
                      :providers {:claude {:disable_tools true}
                                  :openai {:model "gpt-4o-mini"
                                           :disable_tools true}}}
               :build :make
               :dependencies [:nvim-treesitter/nvim-treesitter
                              :stevearc/dressing.nvim
                              :nvim-lua/plenary.nvim
                              :MunifTanjim/nui.nvim
                              :nvim-telescope/telescope.nvim
                              :saghen/blink.cmp
                              :ibhagwan/fzf-lua
                              :nvim-tree/nvim-web-devicons
                              :zbirenbaum/copilot.lua ; for providers='copilot'
                              {1 :HakonHarnes/img-clip.nvim
                               :event :VeryLazy
                               :opts {:embed_image_as_base64 false
                                      :prompt_for_file_name false
                                      :drag_and_drop {:insert_mode true}
                                      :use_absolute_path true}}
                              {1 :MeanderingProgrammer/render-markdown.nvim
                               :opts {:file_types [:markdown :Avante]}
                               :ft [:markdown :Avante]}]}
              ; LSP
              {1 :ray-x/lsp_signature.nvim
               :event :VeryLazy
               :config (fn [_ opts] (let [lsp-signature (require :lsp_signature)] (lsp-signature.setup opts)))}
              {1 :kyazdani42/nvim-tree.lua
               :dependencies [:nvim-tree/nvim-web-devicons]
               :config (. (require :config.plugin.nvim-tree) :config)}
              {1 :stevearc/oil.nvim
               :dependencies [:echasnovski/mini.icons]
               :config true}
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
              ; Autocomplete compatibility layer for nvim-cmp sources
              {1 :saghen/blink.compat
               :version "*" 
               :lazy true
               :opts {}}
              ; Autocomplete
              {1 :saghen/blink.cmp
               :version "v1.*"
               :dependencies [:rafamadriz/friendly-snippets
                              :saghen/blink.compat
                              {1 :mikavilpas/blink-ripgrep.nvim
                               :version "*"}
                              {1 :moyiz/blink-emoji.nvim}]
               :opts {:keymap {:preset :enter
                               :<C-space> false
                               :<Tab> [:show :fallback]}
                      :appearance {:nerd_font_variant :mono}
                      :completion {:documentation {:auto_show false}
                                   :list {:selection {:preselect false}}}
                      :sources {:default [:lsp :path :snippets :buffer :omni :ripgrep :emoji]
                                :per_filetype {:clojure [:lsp :path :snippets :buffer :omni :conjure :ripgrep :emoji]
                                               :fennel [:lsp :path :snippets :buffer :omni :conjure :ripgrep :emoji]
                                               :scheme [:lsp :path :snippets :buffer :omni :conjure :ripgrep :emoji]
                                               :lisp [:lsp :path :snippets :buffer :omni :conjure :ripgrep :emoji]
                                               :markdown [:lsp :path :snippets :buffer :omni :ripgrep :emoji]
                                               :gitcommit [:lsp :path :snippets :buffer :omni :ripgrep :emoji]}
                                :providers {:conjure {:name "Conjure"
                                                     :module "blink.compat.source"
                                                     :opts {}}
                                           :ripgrep {:name "Ripgrep"
                                                    :module "blink-ripgrep"
                                                    :opts {:prefix_min_len 3
                                                           :context_size 5
                                                           :max_filesize "1M"}}
                                           :emoji {:name "Emoji"
                                                  :module "blink-emoji"
                                                  :score_offset 15
                                                  :opts {:insert true
                                                         :trigger (fn [] [":"])}}}}}
               :opts_extend [:sources.default]}
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
              {1 :mfussenegger/nvim-dap-python}
               ; :config (fn [] (let [dap-python (require :dap-python)]
               ;                  (dap-python.setup "python")))}

              ;; Linting and formatting
              ; {1 :nvimtools/none-ls.nvim
              ;  :dependencies [:nvim-lua/plenary.nvim]
              ;  :config (. (require :config.plugin.null-ls) :config)}
              {1 :jay-babu/mason-null-ls.nvim
               :event [:bufreadpre :bufnewfile]
               :dependencies [:williamboman/mason.nvim :nvimtools/none-ls.nvim]
               :config (. (require :config.plugin.mason-null-ls) :config)}
              {1 :stevearc/conform.nvim :opts 
               {:format_on_save {:timeout_ms 500
                                 :lsp_format
                                 "fallback"}
                :formatters_by_ft {:python
                                   ["ruff_fix" 
                                    "ruff_format"
                                    "ruff_organize_imports"]}}}
              {1 :mfussenegger/nvim-lint 
               :config (. (require :config.plugin.nvim-lint) :config)}
              ; {1 :mfussenegger/nvim-lint}
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
              {1 :christoomey/vim-tmux-navigator
               :cmd ["TmuxNavigateLeft"
                     "TmuxNavigateDown"
                     "TmuxNavigateUp"
                     "TmuxNavigateRight"
                     "TmuxNavigatePrevious"]
               :keys [["<c-h>" "<cmd><C-U>TmuxNavigateLeft<cr>"]
                      ["<c-j>" "<cmd><C-U>TmuxNavigateDown<cr>"]
                      ["<c-k>" "<cmd><C-U>TmuxNavigateUp<cr>"]
                      ["<c-l>" "<cmd><C-U>TmuxNavigateRight<cr>"]
                      ["<c-\\>" "<cmd><C-U>TmuxNavigatePrevious<cr>"]]}
              :edkolev/tmuxline.vim
              ;; UI: Theme and colorschemes
              {1 :nyoom-engineering/oxocarbon.nvim}
              :stevearc/dressing.nvim
              {1 :rose-pine/neovim :name "rose-pine"}
              {1 :kosayoda/nvim-lightbulb
               :config (. (require :config.plugin.lightbulb) :config)}
              :marko-cerovac/material.nvim
              ; :rcarriga/nvim-notify
              ; Minimalist status/tabline for vim
              {1 :nvim-lualine/lualine.nvim
               :dependencies [:nvim-tree/nvim-web-devicons]}
              {1 :romgrk/barbar.nvim
               :dependencies [:lewis6991/gitsigns.nvim :nvim-tree/nvim-web-devicons]
               :init #(let [nvim (require :aniseed.nvim)]
                        (set nvim.g.barbar_auto_setup false))
               :config (. (require :config.plugin.barbar) :config)}
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
              ; CSV
              {1 :hat0uma/csvview.nvim
               :opts {:parser {:comments ["#" "//"]}
                      :keymaps {:textobject_field_inner {1 :if :mode [:o :x]}
                                :textobject_field_outer {1 :af :mode [:o :x]}
                                :jump_next_field_end {1 :<Tab> :mode [:n :v]}
                                :jump_prev_field_end {1 :<S-Tab> :mode [:n :v]}
                                :jump_next_row {1 :<Enter> :mode [:n :v]}
                                :jump_prev_row {1 :<S-Enter> :mode [:n :v]}}}
; -- Text objects for selecting fields
;       textobject_field_inner = { "if", mode = { "o", "x" } },
;       textobject_field_outer = { "af", mode = { "o", "x" } },
;       -- Excel-like navigation:
;       -- Use <Tab> and <S-Tab> to move horizontally between fields.
;       -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
;       -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
;       jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
;       jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
;       jump_next_row = { "<Enter>", mode = { "n", "v" } },
;       jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
                                
               :cmd [:CsvViewEnable :CsvViewDisable :CsvViewToggle]}

              ; Trouble
              {1 :folke/trouble.nvim
               :opts {}
               :cmd :Trouble
               :dependencies [:nvim-tree/nvim-web-devicons]}])

(fn init []
  (let [lazy (require :lazy)]
    (lazy.setup specs))
  (let [config-theme (require :config.theme)
        mason (require :mason)
        mason-nvim-dap (require :config.plugin.mason-nvim-dap)]
    ;; Configure the UI theme
    (config-theme.config)
    ;; Packages
    (mason.setup)
    ;; DAP
    (mason-nvim-dap.setup))
  ;; LSP
  (let [config-lsp (require :config.lsp.core)]
    (config-lsp.config)))

{: init}
