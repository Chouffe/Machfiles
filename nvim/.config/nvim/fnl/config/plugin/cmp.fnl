(local lspkind (require :lspkind))
(local cmp-plugin (require :cmp))

(local cmp-src-menu-items
  {:nvim_lsp "lsp"
   :buffer   "buffer"
   :conjure  "conjure"
   :tmux     "tmux"
   :rg       "ripgrep"})

(local cmp-srcs
  [
   {:name :nvim_lsp}
   {:name :nvim_lua}
   ;; FIXME: conjure source throws some errors
   ; {:name :conjure}
   {:name :buffer}
   {:name :path}
   {:name :rg}
   {:name :tmux
    :options {:all_panes false :label "tmux"}}])

(comment
  cmp-plugin.config.mapping
  cmp-plugin.config)

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

(local cmp-mapping
  {:<C-p> (cmp-plugin.mapping.select_prev_item)
   :<C-n> (cmp-plugin.mapping.select_next_item)
   :<C-u> (cmp-plugin.mapping.scroll_docs (- 4))
   :<C-d> (cmp-plugin.mapping.scroll_docs 4)
   :<C-m> (cmp-plugin.mapping.complete)
   ;; These keys are already used (tmux and other plugin)
   ; :<C-Space> (cmp-plugin.mapping.complete)
   ; :<C-c> (cmp-plugin.mapping.complete)
   :<C-e> (cmp-plugin.mapping.close)
   :<CR> (cmp-plugin.mapping.confirm 
           {:behavior cmp-plugin.ConfirmBehavior.Insert :select false} 
           [:i :c])})

(fn config []
  (cmp-plugin.setup 
    {:formatting {:format format-fn}
     :mapping cmp-mapping
     :sources cmp-srcs})
  (cmp-plugin.setup.cmdline :/ {:mapping (cmp-plugin.mapping.preset.cmdline)
                                :sources [{:name :buffer}]})
  (cmp-plugin.setup.cmdline :: {:mapping (cmp-plugin.mapping.preset.cmdline)
                                :sources [{:name :cmdline}
                                          {:name :path}]}))

{: config}
