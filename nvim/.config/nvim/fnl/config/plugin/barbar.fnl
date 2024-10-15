(fn config []
  (let [barbar (require :barbar)]
    (barbar.setup
      {:animation false
       :auto_hide true
       :icons {:separator_at_end false
               :separator {:left "" :right ""}}})))

(fn register-keybindings []
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 "<A-,>" 2 "<Cmd>BufferPrevious<CR>" :desc "previous buffer"}
       {1 "<A-.>" 2 "<Cmd>BufferNext<CR>" :desc "next buffer"}
       {1 "<A-<>" 2 "<Cmd>BufferMovePrevious<CR>" :desc "re order to previous"}
       {1 "<A->>" 2 "<Cmd>BufferMoveNext<CR>" :desc "re order to next"}
       {1 "<A-1>" 2 "<Cmd>BufferGoto 1<CR>" :desc "buffer go to 1"}
       {1 "<A-2>" 2 "<Cmd>BufferGoto 2<CR>" :desc "buffer go to 2"}
       {1 "<A-3>" 2 "<Cmd>BufferGoto 3<CR>" :desc "buffer go to 3"}
       {1 "<A-4>" 2 "<Cmd>BufferGoto 4<CR>" :desc "buffer go to 4"}
       {1 "<A-5>" 2 "<Cmd>BufferGoto 5<CR>" :desc "buffer go to 5"}
       {1 "<A-6>" 2 "<Cmd>BufferGoto 6<CR>" :desc "buffer go to 6"}
       {1 "<A-7>" 2 "<Cmd>BufferGoto 7<CR>" :desc "buffer go to 7"}
       {1 "<A-8>" 2 "<Cmd>BufferGoto 8<CR>" :desc "buffer go to 8"}
       {1 "<A-9>" 2 "<Cmd>BufferGoto 9<CR>" :desc "buffer go to 9"}
       {1 "<A-c>" 2 "<Cmd>BufferClose<CR>" :desc "close buffer"}
       {1 "<A-p>" 2 "<Cmd>BufferPin<CR>" :desc "pin buffer"}
       {1 "<A-b>" 2 "<Cmd>BufferPick<CR>" :desc "pick buffer"}])))

{: config
 : register-keybindings}
