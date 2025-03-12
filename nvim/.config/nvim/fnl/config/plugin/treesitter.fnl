(fn config []
  (let [treesitter (require :nvim-treesitter.configs)
        nvim-ts-autotag (require :nvim-ts-autotag)]
    (nvim-ts-autotag.setup)
    (treesitter.setup {:highlight {:enable true}
                       :rainbow {:enable true
                                 ;; List of languages you want to disable the plugin for
                                 ; :disable [:cpp]
                                 ;; Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                                 :extended_mode true
                                 ;; Do not enable for files with more than n lines, int
                                 :max_file_lines nil}
                       :indent {:enable true}
                       :incremental_selection {:enable true
                                               :keymaps {:init_selection :<C-n>
                                                         :node_incremental :<C-n>
                                                         :scope_incremental :<C-s>
                                                         :node_decremental :<C-m>}}
                       :ensure_installed [:bash
                                          :c
                                          :clojure
                                          :diff
                                          :dockerfile
                                          :fennel
                                          :go
                                          :html
                                          :javascript
                                          :jsdoc
                                          :json
                                          :jsonc
                                          :lua
                                          :lua
                                          :luadoc
                                          :luap
                                          :markdown
                                          :markdown_inline
                                          :python
                                          :python
                                          :query
                                          :regex
                                          :toml
                                          :tsx
                                          :typescript
                                          :vim
                                          :vimdoc
                                          :yaml]})))

{: config}
