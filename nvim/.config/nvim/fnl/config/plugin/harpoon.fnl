(fn config []
  (let [harpoon (require :harpoon)]
    (harpoon.setup {})))

(fn register-keybindings []
  (let [harpoon (require :harpoon)
        which-key (require :which-key)]
    (which-key.add
      [{1 "<A-h>" :group "harpoon"}
       {1 (.. "<A-h>" :a) 2 #(: (harpoon:list) :add) :desc "add"}
       {1 (.. "<A-h>" :e) 2 #(harpoon.ui:toggle_quick_menu (harpoon:list)) :desc "toggle menu"}
       {1 (.. "<A-h>" :h) 2 #(harpoon.ui:toggle_quick_menu (harpoon:list)) :desc "toggle menu"}
       {1 (.. "<A-h>" :1) 2 #(: (harpoon:list) :select 1) :desc "select 1"}
       {1 (.. "<A-h>" :2) 2 #(: (harpoon:list) :select 2) :desc "select 2"}
       {1 (.. "<A-h>" :3) 2 #(: (harpoon:list) :select 3) :desc "select 3"}
       {1 (.. "<A-h>" :4) 2 #(: (harpoon:list) :select 4) :desc "select 4"}
       {1 (.. "<A-h>" :p) 2 #(: (harpoon:list) :prev) :desc "previous"}
       {1 (.. "<A-h>" :n) 2 #(: (harpoon:list) :next) :desc "next"}])))

{: config : register-keybindings}
