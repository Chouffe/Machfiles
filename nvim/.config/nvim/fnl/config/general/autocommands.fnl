(local nvim (require :aniseed.nvim))

(fn python-setup []
  (let [python-group-id (vim.api.nvim_create_augroup :python_config {})]
    (vim.api.nvim_create_autocmd
      :BufWritePost
      {:group python-group-id
       :pattern "*.py"
       :callback (fn [_]
                   (vim.api.nvim_command ":silent !black %"))
       :desc "Format python code with Black"})))

(fn general-clean-setup []
  (let [group-id (vim.api.nvim_create_augroup :config_group {})]
    (vim.api.nvim_create_autocmd
      :BufWinLeave
      {:pattern "*"
       :group group-id
       :callback (fn [_] (vim.fn.clearmatches))
       :desc "Clears matches"})))
    ; TODO: make sure that the buffer is not too large: it can take a long time otherwise
    ; (vim.api.nvim_create_autocmd
    ;   :BufWritePre
    ;   {:pattern "*"
    ;    :group group-id
    ;    :callback functions.trim-whitespace
    ;    :desc "Trims whitespace and empty end of buffer blank lines"})))

(fn register-qf-list-keybindings []
  (let [win-id (vim.fn.win_getid)
        which-key (require :which-key)
        util (require :lib.util)]
    (when (util.loclist? win-id)
      (which-key.register
        {:<CR> [":.ll<CR>" "jump"]}
        {:buffer (nvim.get_current_buf)}))))

(fn quickfix-list-setup []
  (let [group-id (vim.api.nvim_create_augroup :quickfix_list_group {})]
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern "qf"
       :group group-id
       :callback register-qf-list-keybindings
       :desc "Registers quickfix list keybindings"})))

(fn setup []
  (python-setup)
  (general-clean-setup)
  (quickfix-list-setup))

{: setup}
