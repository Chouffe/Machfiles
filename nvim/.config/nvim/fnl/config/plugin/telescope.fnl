(module config.plugin.telescope
  {autoload {a aniseed.core
             nvim aniseed.nvim
             telescope telescope
             t telescope.builtin
             actions telescope.actions
             themes telescope.themes
             which-key which-key}})

(def- telescope-mappings
  {:<C-A> actions.toggle_all
   :<C-H> actions.which_key
   :<C-Q> (+ actions.smart_send_to_qflist actions.open_qflist)
   :<C-L> actions.close
   :<C-J> actions.cycle_history_next
   :<C-K> actions.cycle_history_prev
   :<Esc> actions.close})

(defn- map [function label opts]
  (a.merge [function label] opts))

(defn config []
  (telescope.load_extension "fzf")
  (telescope.load_extension "file_browser")
  (telescope.load_extension "ui-select")
  ; (telescope.load_extension "emoji")
  ; (telescope.load_extension "packer")
  (telescope.setup {:defaults {:mappings {:i telescope-mappings}
                               :file_ignore_patterns ["node_modules"]}
                    :extensions {:fzf {:case_mode :smart_case
                                       :fuzzy true
                                       :override_file_sorter true
                                       :override_generic_sorter true}
                                 :ui-select (themes.get_cursor)}
                    :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

  (which-key.register
    {:name "find"
     :v {:name "vim"
         :g (map #(t.live_grep {:cwd "~/.config/nvim"}) "Search in project")
         :f (map #(t.find_files {:cwd "~/.config/nvim"}) "Files")}
     :n     (map #(t.find_files {:cwd "~/notes"}) "Search Notes")
     :/     (map t.search_history "Search history")
     :w     (map t.grep_string "Search string under cursor")
     :m     (map t.marks "Marks")
     ::     (map t.command_history "Command history")
     :b     (map t.buffers "Buffers")
     :r     (map t.resume "Resume last Telescope")
     :f     (map t.find_files "Files")
     :g     (map t.live_grep "Search in project")
     :h     (map t.help_tags "Help tags")
     :k     (map t.keymaps "Keymaps")
     :o     (map t.oldfiles "Oldfiles")
     :t     (map t.builtin "Telescope pickers")
     "<CR>" (map ":Telescope " "Enter find command..." {:silent false})}
    {:prefix "<Leader>f"}))
