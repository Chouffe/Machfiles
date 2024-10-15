(fn config []
  (let [noice (require :noice)]
    (noice.setup
      {:message {:view "mini" :view_warn "mini"}
       :lsp {:signature {:enabled false}
             :override {["vim.lsp.util.convert_input_to_markdown_lines"] true
                        ["vim.lsp.util.stylize_markdown"] true}}
       :presets {:bottom_search true
                 :command_palette true
                 :long_message_to_split true
                 :inc_rename true
                 :lsp_doc_border true}})))

{: config}
