(module config.general.autocommands
  {autoload {functions config.general.functions
             nvim aniseed.nvim
             which-key which-key}})

(defn- python-setup []
  (let [python-group-id (vim.api.nvim_create_augroup :python_config {})]
    (vim.api.nvim_create_autocmd
      :BufWritePost
      {:group python-group-id
       :pattern "*.py"
       :callback (fn [_]
                   (vim.api.nvim_command ":silent !black %"))
       :desc "Format python code with Black"})))

(defn- general-clean-setup []
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

(defn- register-quickfix-keybindings []
  (which-key.register
    {:<CR> [":.ll<CR>" "jump"]}
    {:buffer (nvim.get_current_buf)}))

(defn- quickfix-list-setup []
  (let [group-id (vim.api.nvim_create_augroup :quickfix_list_group {})]
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern "qf"
       :group group-id
       :callback register-quickfix-keybindings
       :desc "Registers quickfix keybindings"})))

(defn setup []
  (python-setup)
  (general-clean-setup)
  (quickfix-list-setup))
