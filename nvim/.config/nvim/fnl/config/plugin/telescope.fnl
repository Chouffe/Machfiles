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
    (which-key.register
      {:name "find"
       :b     (map t.buffers "Buffers")
       :f     (map t.find_files "Files")
       :g     (map t.live_grep "Search in project")
       :h     (map t.help_tags "Help tags")
       :k     (map t.keymaps "Keymaps")
       :m     (map t.marks "Marks")
       :n     (map #(t.find_files {:cwd "~/notes"}) "Search Notes")
       :o     (map t.oldfiles "Oldfiles")
       :r     (map t.resume "Resume last Telescope")
       :s     (map t.symbols "Symbols")
       :t     (map t.builtin "Telescope pickers")
       :v {:name "vim"
           :g (map #(t.live_grep {:cwd "~/.config/nvim"}) "Search in project")
           :f (map #(t.find_files {:cwd "~/.config/nvim"}) "Files")}
       :w     (map t.grep_string "Search string under cursor")
       :<CR>  (map ":Telescope " "Enter find command..." {:silent false})
       ::     (map t.command_history "Command history")
       :/     (map t.search_history "Search history")}
      {:prefix "<Leader>f"})))

(fn config []
  (load-extensions)
  (register-keybindings)
  (let [actions (require :telescope.actions)
        telescope-mappings (make-telescope-mappings actions)
        telescope (require :telescope)
        themes (require :telescope.themes)]
    (telescope.setup
      {:defaults {:mappings {:i telescope-mappings}
                  :file_ignore_patterns ["node_modules"]}
       :extensions {:fzf {:case_mode :smart_case
                          :fuzzy true
                          :override_file_sorter true
                          :override_generic_sorter true}
                    :ui-select (themes.get_cursor)}
       :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})))

{: config
 : register-keybindings}
