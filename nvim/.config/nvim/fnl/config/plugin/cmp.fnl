(local lspkind (require :lspkind))
(local cmp (require :cmp))

(local cmp-src-menu-items
  {:nvim_lsp "lsp"
   :buffer   "buffer"
   :conjure  "conjure"
   :tmux     "tmux"
   :rg       "ripgrep"})

(local cmp-srcs
  [{:name :nvim_lsp}
   {:name :nvim_lua}
   {:name :conjure}
   {:name :buffer}
   {:name :path}
   {:name :rg}
   {:name :tmux
    :options {:all_panes false :label "tmux"}}])

(local format-fn
  (lspkind.cmp_format
    {:with_text false ; do not show text alongside icons
     ; prevent the popup from showing more than provided
     ; characters (e.g 50 will not show more than 50
     ; characters)
     :mode :symbol ; show only symbol annotations
     :maxwidth 50
     ; will be called before any modifications from lspkind
     ; to provide more controls on modifications
     :before (fn [entry item]
               (set item.menu
                    (or (string.format "[%s]" (. cmp-src-menu-items entry.source.name))
                        ""))
               item)}))

(local mapping
  {:<C-p> (cmp.mapping.select_prev_item)
   :<C-n> (cmp.mapping.select_next_item)
   :<C-u> (cmp.mapping.scroll_docs (- 4))
   :<C-d> (cmp.mapping.scroll_docs 4)
   :<C-Space> (cmp.mapping.complete)
   :<C-e> (cmp.mapping.close)
   :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                               :select false} [:i :c])})

(fn config []
  (cmp.setup {:formatting {:format format-fn}
              :mapping mapping
              :sources cmp-srcs})
  (cmp.setup.cmdline :/ {:mapping (cmp.mapping.preset.cmdline)
                         :sources [{:name :buffer}]})
  (cmp.setup.cmdline :: {:mapping (cmp.mapping.preset.cmdline)
                         :sources [{:name :cmdline}
                                   {:name :path}]}))

{: config}
