(fn make-telescope-mappings [telescope-actions]
  {:<C-A> telescope-actions.toggle_all
   :<C-H> telescope-actions.which_key
   :<C-Q> (+ telescope-actions.smart_send_to_qflist telescope-actions.open_qflist)
   :<C-L> telescope-actions.close
   :<C-J> telescope-actions.cycle_history_next
   :<C-K> telescope-actions.cycle_history_prev
   :<Esc> telescope-actions.close})

(fn map [function label opts]
  (let [a (require :aniseed.core)]
    (a.merge [function label] opts)))

(fn load-extensions []
  (let [extensions ["fzf" "ui-select"]
        telescope (require :telescope)]
    (each [_ extension-name (ipairs extensions)]
      (telescope.load_extension extension-name))))

(fn register-keybindings []
  (let [t (require :telescope.builtin)
        which-key (require :which-key)]
    (which-key.add
      [{1 :<Leader>f :group "find"}
       {1 :<Leader>f/ 2 t.search_history :desc "search history"}
       {1 :<Leader>f: 2 t.command_history :desc "command history"}
       {1 :<Leader>f<CR> 2 ":Telescope " :desc "enter find command..." :silent false}
       {1 :<Leader>fR 2 t.resume :desc "resume last telescope"}
       {1 :<Leader>fb 2 t.buffers :desc "buffers"}
       {1 :<Leader>ff 2 t.find_files :desc "files"}
       {1 :<Leader>fg 2 t.live_grep :desc "live grep"}
       {1 :<Leader>fh 2 t.help_tags :desc "help tags"}
       {1 :<Leader>fk 2 t.keymaps :desc "keymaps"}
       {1 :<Leader>fm 2 t.marks :desc "marks"}
       {1 :<Leader>fn 2 #(t.find_files {:cwd "~/notes"}) :desc "notes"}
       {1 :<Leader>fo 2 t.oldfiles :desc "old files"}
       {1 :<Leader>fr 2 t.lsp_references :desc "lsp references"}
       {1 :<Leader>fs 2 t.symbols :desc "symbols"}
       {1 :<Leader>ft 2 t.builtin :desc "telescope pickers"}
       {1 :<Leader>fv :group "vim"}
       {1 :<Leader>fvg 2 #(t.live_grep {:cwd "~/.config/nvim"}) :desc "live grep config"}
       {1 :<Leader>fvf 2 #(t.find_files {:cwd "~/.config/nvim"}) :desc "files"}
       {1 :<Leader>fw 2 t.grep_string :desc "grep word"}])))

    ; (which-key.register
    ;   {:name "find"
    ;    :b     (map t.buffers "Buffers")
    ;    :f     (map t.find_files "Files")
    ;    :g     (map t.live_grep "Search in project")
    ;    :h     (map t.help_tags "Help tags")
    ;    :k     (map t.keymaps "Keymaps")
    ;    :m     (map t.marks "Marks")
    ;    :n     (map #(t.find_files {:cwd "~/notes"}) "Search Notes")
    ;    :o     (map t.oldfiles "Oldfiles")
    ;    :r     (map t.lsp_references "lsp references")
    ;    :R     (map t.resume "Resume last Telescope")
    ;    :s     (map t.symbols "Symbols")
    ;    :t     (map t.builtin "Telescope pickers")
    ;    :v {:name "vim"
    ;        :g (map #(t.live_grep {:cwd "~/.config/nvim"}) "Search in project")
    ;        :f (map #(t.find_files {:cwd "~/.config/nvim"}) "Files")}
    ;    :w     (map t.grep_string "Search string under cursor")
    ;    :<CR>  (map ":Telescope " "Enter find command..." {:silent false})
    ;    ::     (map t.command_history "Command history")
    ;    :/     (map t.search_history "Search history")}
    ;   {:prefix "<Leader>f"})))

(fn config []
  (load-extensions)
  (register-keybindings)
  (let [actions (require :telescope.actions)
        telescope-mappings (make-telescope-mappings actions)
        telescope (require :telescope)
        themes (require :telescope.themes)]
    (telescope.setup
      {:defaults {:mappings {:i telescope-mappings}
                  :file_ignore_patterns ["node_modules" ".venv"]}
       :extensions {:fzf {:case_mode :smart_case
                          :fuzzy true
                          :override_file_sorter true
                          :override_generic_sorter true}
                    :ui-select (themes.get_cursor)}
       :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})))

{: config
 : register-keybindings}
