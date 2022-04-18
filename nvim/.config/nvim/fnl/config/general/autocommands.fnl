(module config.general.autocommands
  {autoload {nvim aniseed.nvim
             functions config.general.functions}
   require-macros [config.macros]})

(defn setup []
  (let [group-id (vim.api.nvim_create_augroup :config_group {})]
    (vim.api.nvim_create_autocmd
      :BufWinLeave
      {:pattern "*"
       :group group-id
       :callback (fn [_] (vim.fn.clearmatches))
       :desc "Clears matches"})
    (vim.api.nvim_create_autocmd
      :BufWritePre
      {:pattern "*"
       :group group-id
       :callback functions.trim-whitespace
       :desc "Trims whitespace and empty end of buffer blank lines"})))

(comment
  (print "hello")
  ; (nvim.create_autocmnd
  ;   "BufEnter"
  ;   {:pattern "*"
  ;    :callback (fn [args] (print "HELLO!"))
  ;    :desc "Tell me when I enter a buffer!"})

  (vim.api.nvim_create_augroup)

  (vim.api.nvim_create_autocmd
    :BufEnter
    {:pattern "*"
     :callback (fn [args] (print (.. "HELLO! " (tostring args))))
     :desc "Tell me when I enter a buffer!"})

  ;; Create a user command via nvim api
  (nvim.create_user_command
    "SayHello"
    (fn [args] (print "hello World"))
    {:nargs "*" :desc "Say hi to someone"}))
