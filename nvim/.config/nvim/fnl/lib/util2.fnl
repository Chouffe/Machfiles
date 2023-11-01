(local a (require :aniseed.core))
(local str (require :aniseed.string))
(local nvim (require :aniseed.nvim))

(fn set-opts [prefix opts]
  (each [k v (pairs opts)]
    (let [[scope prefix*] (str.split prefix ":")]
      (a.assoc-in nvim [scope (str.join "" [prefix* k])] v))))

(fn map [mode from to opts]
  (nvim.set_keymap mode from to (a.merge {:noremap true} opts)))

(fn map! [mode from to opts]
  (map mode from to (a.assoc opts :silent true)))

(fn bmap [bufnr mode from to opts]
  (nvim.buf_set_keymap bufnr mode from to (a.merge {:noremap true} opts)))

(fn bmap! [bufnr mode from to opts]
  (bmap bufnr mode from to (a.assoc opts :silent true)))

(fn loclist? [win-id]
  (let [win-info (a.first (vim.fn.getwininfo win-id))]
    (= 1 (. win-info :loclist))))

(fn quickfix? [win-id]
  (let [win-info (a.first (vim.fn.getwininfo win-id))]
    (= 1 (. win-info :quickfix))))

{: set-opts
 : map
 : map!
 : bmap
 : bmap!
 : loclist?
 : quickfix?}
