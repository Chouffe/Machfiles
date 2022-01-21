(module config.general.functions
  {autoload {nvim conjure.aniseed.nvim
             u config.general.utils
             a aniseed.core}})

(defn toggle_highlight_at_colorcolumn []
  "Toggles the color specified by colorcolumn."
  (let [colorcolumn nvim.o.colorcolumn
        textwidth nvim.o.textwidth]
    (if
      (and (u.empty? colorcolumn)
           (u.empty? textwidth))
      (set vim.o.colorcolumn "80")

      (and (u.empty? colorcolumn)
           (not (u.empty? textwidth)))
      (set vim.o.colorcolumn "+1")

      (set vim.o.colorcolumn ""))))

(defn trim_whitespace []
  "Trims whitespace from the current buffer"
  (nvim.command "%substitute/\\s\\+$//e"))

(defn toggle_parinfer
  []
  "Toggles Parinfer editing mode"
  (if (= nvim.g.parinfer_enabled 0)
    (do
      (print "Enabling Parinfer")
      (nvim.command "ParinferOn"))
    (do
      (print "Disabling Parinfer")
      (nvim.command "ParinferOff"))))

(comment
  (do
    (nvim.command "echohl ErrorMsg")
    (nvim.command "echomsg \"No write since last change\"")
    (nvim.command "echohl NONE")))

(defn delete_buffer []
  "Deletes the current buffer."
  (let [total-nr-buffers (-> (nvim.fn.range 1 (nvim.fn.bufnr "$"))
                             (nvim.fn.filter "buflisted(v:val)")
                             (a.count))]
    (if
      nvim.bo.modified
      (do
        (nvim.command "echohl ErrorMsg")
        (nvim.command "echomsg \"No write since last change\"")
        (nvim.command "echohl NONE"))

      (= 1 total-nr-buffers)
      (do
        (nvim.command "bdelete")
        (print "Buffer deleted. Created new buffer."))

      :else
      (do
        (nvim.command "bprevious")
        (nvim.command "bdelete #")
        (print "Buffer deleted.")))))
