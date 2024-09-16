(fn register-keybindings [prefix]
  (let [which-key (require :which-key)
        dap (require :dap)
        dapui (require :dapui)
        dap-widgets (require :dap.ui.widgets)]
    (which-key.register
      {:d {:name "debug"
           :b [dap.toggle_breakpoint "breakpoint toggle"]
           :c [dap.continue "continue"]
           :e [dapui.eval "eval"]
           :s [(fn [] (dap-widgets.centered_float dap-widgets.scopes)) "scopes"]
           :f [(fn [] (dap-widgets.centered_float dap-widgets.frames)) "frames"]
           :h [dap-widgets.hover "hover"]
           :p [dap-widgets.preview "preview"]
           :i [dap.step_into "step into"]
           :u [dapui.toggle "ui toggle"]
           :o [dap.step_over "step over"]
           :O [dap.step_out "step out"]
           :r [dap.repl.open "repl"]}}
      {:prefix prefix})))

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
