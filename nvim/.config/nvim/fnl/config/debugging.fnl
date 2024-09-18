(fn register-keybindings [prefix]
  (let [which-key (require :which-key)
        dap (require :dap)
        dapui (require :dapui)
        dap-widgets (require :dap.ui.widgets)]
    (which-key.add
      [{1 (.. prefix :d) :group "debug"}
       {1 (.. prefix :db) 2 dap.toggle_breakpoint :desc "breakpoint toggle"}
       {1 (.. prefix :dO) 2 dap.step_out :desc "step out"}
       {1 (.. prefix :do) 2 dap.step_over :desc "step over"}
       {1 (.. prefix :di) 2 dap.step_into :desc "step into"}
       {1 (.. prefix :dc) 2 dap.continue :desc "continue"}
       {1 (.. prefix :de) 2 dapui.eval :desc "eval"}
       {1 (.. prefix :dr) 2 dap.repl.open :desc "repl"}
       {1 (.. prefix :du) 2 dapui.toggle :desc "ui toggle"}
       {1 (.. prefix :dp) 2 dap-widgets.preview :desc "preview"}
       {1 (.. prefix :df) 2 (fn [] (dap-widgets.centered_float dap-widgets.frames)) :desc "frames"}
       {1 (.. prefix :dh) 2 dap-widgets.hover :desc "hover"}
       {1 (.. prefix :ds) 2 (fn [] (dap-widgets.centered_float dap-widgets.scopes)) :desc "scopes"}])))

    ; (which-key.register
    ;   {:d {:name "debug"
    ;        :b [dap.toggle_breakpoint "breakpoint toggle"]
    ;        :c [dap.continue "continue"]
    ;        :e [dapui.eval "eval"]
    ;        :s [(fn [] (dap-widgets.centered_float dap-widgets.scopes)) "scopes"]
    ;        :f [(fn [] (dap-widgets.centered_float dap-widgets.frames)) "frames"]
    ;        :h [dap-widgets.hover "hover"]
    ;        :p [dap-widgets.preview "preview"]
    ;        :i [dap.step_into "step into"]
    ;        :u [dapui.toggle "ui toggle"]
    ;        :o [dap.step_over "step over"]
    ;        :O [dap.step_out "step out"]
    ;        :r [dap.repl.open "repl"]}}
    ;   {:prefix prefix})))

(fn setup-dap-ui []
  (let [dap (require :dap)
        dapui (require :dapui)]
    (set dap.listeners.before.attach.dapui_config dapui.open)
    (set dap.listeners.before.launch.dapui_config dapui.open)
    (set dap.listeners.before.event_terminated.dapui_config dapui.close)
    (set dap.listeners.before.event_exited.dapui_config dapui.close)))

(fn setup []
  (setup-dap-ui))

{: setup-dap-ui
 : setup
 : register-keybindings}
