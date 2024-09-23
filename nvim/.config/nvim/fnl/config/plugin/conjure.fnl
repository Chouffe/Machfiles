(local a (require :aniseed.core))
(local nvim (require :aniseed.nvim))
(local str (require :aniseed.string))

(local prefix "<LocalLeader>")

(fn setup []
  (set nvim.g.conjure#mapping#doc_word "K")
  (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
  ; (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled true)
  (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false))

(fn register-keybindings [bufnr]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :l) :group "logs conjure" :buffer bufnr}
       {1 (.. prefix :l :e) :desc "open in current buffer" :buffer bufnr}
       {1 (.. prefix :l :g) :desc "toggle" :buffer bufnr}
       {1 (.. prefix :l :q) :desc "close" :buffer bufnr}
       {1 (.. prefix :l :l) :desc "jump to last result" :buffer bufnr}
       {1 (.. prefix :l :r) :desc "clear" :buffer bufnr}
       {1 (.. prefix :l :R) :desc "reset" :buffer bufnr}
       {1 (.. prefix :l :s) :desc "open in horizontal split" :buffer bufnr}
       {1 (.. prefix :l :v) :desc "open in vertical split" :buffer bufnr}
       {1 (.. prefix :l :t) :desc "open in new tab" :buffer bufnr}
       ;;
       {1 (.. prefix :E) :desc "eval motion" :buffer bufnr}
       {1 (.. prefix :E) :desc "eval selection" :buffer bufnr :mode [:v]}
       ;;
       {1 (.. prefix :e) :group "eval" :buffer bufnr}
       {1 (.. prefix :e :!) :desc "replace form with result" :buffer bufnr}
       {1 (.. prefix :e :b) :desc "buffer" :buffer bufnr}
       {1 (.. prefix :e :c) :group "comment" :buffer bufnr}
       {1 (.. prefix :e :c :e) :desc "current form to comment" :buffer bufnr}
       {1 (.. prefix :e :c :r) :desc "root form to comment" :buffer bufnr}
       {1 (.. prefix :e :c :w) :desc "word to comment" :buffer bufnr}
       {1 (.. prefix :e :d) :desc "look up documentation" :buffer bufnr}
       {1 (.. prefix :e :e) :desc "current form" :buffer bufnr}
       {1 (.. prefix :e :f) :desc "file from disk" :buffer bufnr}
       {1 (.. prefix :e :m) :desc "form at mark" :buffer bufnr}
       {1 (.. prefix :e :r) :desc "root form" :buffer bufnr}
       {1 (.. prefix :e :w) :desc "word" :buffer bufnr}])))

    ; (which-key.register
    ;   {:l {:name "log"
    ;        :e "Open log in current buffer"
    ;        :g "Toggle log"
    ;        :l "Jump to last result"
    ;        :q "Close log"
    ;        :r "Clear log"
    ;        :R "Reset log"
    ;        :s "Open log in horizontal split"
    ;        :t "Open log in new tab"
    ;        :v "Open log in vertical split"}
    ;    :E "Evaluate motion"
    ;    :e {:name "eval"
    ;        :! "Replace form with result"
    ;        :b "Evaluate buffer"
    ;        :c {:name "comment"
    ;            :e "Evaluate current form to comment"
    ;            :r "Evaluate root form to comment"
    ;            :w "Evaluate word to comment"}
    ;        :d "Look up documentation"
    ;        :e "Evaluate current form"
    ;        :f "Evaluate file from disk"
    ;        :m "Evaluate form at mark"
    ;        :r "Evaluate root form"
    ;        :w "Evaluate word"}
    ;    :gd "Jump to definition"}
    ;   {:prefix prefix
    ;    :buffer bufnr})
    ;
    ; (which-key.register
    ;   {:E "Evaluate selection"}
    ;   {:prefix prefix
    ;    :mode :v
    ;    :buffer bufnr})))

(fn register-keymap-clojure [bufnr]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :c) :group "connection" :buffer bufnr}
       {1 (.. prefix :c :d) :desc "disconnect from nREPL server" :buffer bufnr}
       {1 (.. prefix :c :f) :desc "connect via nREPL port file" :buffer bufnr}
       {1 (.. prefix :e :i) :desc "interrupt evaluation" :buffer bufnr}
       {1 (.. prefix :e :v) :group "view" :buffer bufnr}
       {1 (.. prefix :e :v :e) :desc "last exception" :buffer bufnr}
       {1 (.. prefix :e :v :1) :desc "last evaluation result" :buffer bufnr}
       {1 (.. prefix :e :v :2) :desc "2nd last evaluation result" :buffer bufnr}
       {1 (.. prefix :e :v :3) :desc "3rd last evaluation result" :buffer bufnr}
       {1 (.. prefix :e :v :s) :desc "source" :buffer bufnr}
       {1 (.. prefix :s) :group "session" :buffer bufnr}
       {1 (.. prefix :s :c) :desc "clone current session" :buffer bufnr}
       {1 (.. prefix :s :f) :desc "create fresh session" :buffer bufnr}
       {1 (.. prefix :s :l) :desc "list sessions" :buffer bufnr}
       {1 (.. prefix :s :n) :desc "next sessions" :buffer bufnr}
       {1 (.. prefix :s :p) :desc "previous sessions" :buffer bufnr}
       {1 (.. prefix :s :q) :desc "close current session" :buffer bufnr}
       {1 (.. prefix :s :Q) :desc "close all sessions" :buffer bufnr}
       {1 (.. prefix :s :s) :desc "select session" :buffer bufnr}
       {1 (.. prefix :t) :group "test" :buffer bufnr}
       {1 (.. prefix :t :a) :desc "run all tests" :buffer bufnr}
       {1 (.. prefix :t :c) :desc "run test at cursor" :buffer bufnr}
       {1 (.. prefix :t :c) :desc "run test at cursor" :buffer bufnr}
       {1 (.. prefix :t :n) :desc "run test in namespace" :buffer bufnr}
       {1 (.. prefix :t :N) :desc "run test in alternate namespace" :buffer bufnr}
       {1 (.. prefix :r) :group "refresh" :buffer bufnr}
       {1 (.. prefix :r :a) :desc "refresh all namespaces" :buffer bufnr}
       {1 (.. prefix :r :c) :desc "clear namespace refresh cache" :buffer bufnr}
       {1 (.. prefix :r :r) :desc "refresh all changed namespaces" :buffer bufnr}])))

    ; (which-key.register
    ;   {:c {:name "connection"
    ;        :d "Disconnect from nREPL server"
    ;        :f "Connect via nREPL port file"}
    ;    :ei "Interrupt evaluation"
    ;    :v {:name "view"
    ;        :e "View last exception"
    ;        :1 "View last evaluation result"
    ;        :2 "View 2nd last evaluation result"
    ;        :3 "View 3rd last evaluation result"
    ;        :s "View source"}
    ;    :s {:name "session"
    ;        :c "Clone current session"
    ;        :f "Create fresh session"
    ;        :l "List sessions"
    ;        :n "Next session"
    ;        :p "Previous session"
    ;        :q "Close current session"
    ;        :Q "Close all sessions"
    ;        :s "Select session..."}
    ;    :t {:name "test"
    ;        :a "Run all tests"
    ;        :c "Run test at cursor"
    ;        :n "Run tests in namespace"
    ;        :N "Run tests in alternate namespace"}
    ;    :r {:name "refresh"
    ;        :a "Refresh all namespaces"
    ;        :c "Clear namespace refresh cache"
    ;        :r "Refresh all changed namespaces"}}
    ;   {:prefix prefix :buffer bufnr})))

(fn register-keymap-fennel [bufnr]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :c) :buffer bufnr :group "connection"}
       {1 (.. prefix :c :s) :buffer bufnr :desc "start REPL"}
       {1 (.. prefix :c :S) :buffer bufnr :desc "stop REPL"}
       {1 (.. prefix :e :F) :buffer bufnr :desc "reload current file"}])))
    ; (which-key.register
    ;   {:c {:name "connection"
    ;        :s "Start REPL"
    ;        :S "Stop REPL"}
    ;    :eF "Reload current file"}
    ;   {:prefix prefix :buffer bufnr})))

(fn register-keymap-lisp-janet [bufnr]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :c) :buffer bufnr :group "connection"}
       {1 (.. prefix :c :c) :buffer bufnr :desc "connect to REPL"}
       {1 (.. prefix :c :d) :buffer bufnr :desc "disconnect from REPL"}])))
    ; (which-key.register
    ;   {:c {:name "connection"
    ;        :c "Connect to REPL"
    ;        :d "Disconnect from REPL"}}
    ;   {:prefix prefix :buffer bufnr})))

(fn register-keymap-hy-racket [bufnr]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :c) :buffer bufnr :group "connection"}
       {1 (.. prefix :c :s) :buffer bufnr :desc "start REPL"}
       {1 (.. prefix :c :S) :buffer bufnr :desc "stop REPL"}
       {1 (.. prefix :e :i) :buffer bufnr :desc "interrupt evaluation"}])))
    ; (which-key.register
    ;   {:c {:name "connection"
    ;        :s "Start REPL"
    ;        :S "Stop REPL"}
    ;    :ei "Interrupt evaluation"}
    ;   {:prefix prefix :buffer bufnr})))

(fn register-keymap-hy-scheme [bufnr]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :c) :buffer bufnr :group "connection"}
       {1 (.. prefix :c :s) :buffer bufnr :desc "start REPL"}
       {1 (.. prefix :c :S) :buffer bufnr :desc "stop REPL"}])))
    ; (which-key.register
    ;   {:c {:name "connection"
    ;        :s "Start REPL"
    ;        :S "Stop REPL"}}
    ;   {:prefix prefix :buffer bufnr})))

(fn config []
  (setup)
  (let [sexp-config (require :config.plugin.sexp)
        group-name :plugin_conjure
        group-id (vim.api.nvim_create_augroup group-name {})]
    (sexp-config.config)
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern (str.join "," (a.get vim.g "conjure#filetypes"))
       :callback #(register-keybindings (nvim.get_current_buf))
       :desc "Keymap bindings for conjure"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "clojure"
       :callback #(register-keymap-clojure (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Clojure"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "fennel"
       :callback #(register-keymap-fennel (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Fennel"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "lisp,janet"
       :callback #(register-keymap-lisp-janet (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Lisp, Janet"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "hy,racket"
       :callback #(register-keymap-hy-racket (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Hy, Racket"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "Scheme"
       :callback #(register-keymap-hy-scheme (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Scheme"})))

{: config}
