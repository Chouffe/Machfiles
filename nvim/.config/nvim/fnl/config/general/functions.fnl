(module config.general.functions
  {autoload {nvim conjure.aniseed.nvim
             lib lib.core
             u config.general.utils
             a aniseed.core}})

(defn toggle-highlight-at-colorcolumn []
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

(defn remove-line [bufnr idx]
  "Remove the line at index `idx` in buffer `bufnr`. 0 for current buffer."
  (nvim.buf_set_lines bufnr idx (a.inc idx) true []))

(defn remove-empty-lines-end-buffer [bufnr]
  "Removes all empty lines at the end of buffer `bufnr`."
  (let [blank-lines-end-buffer (->> (nvim.buf_get_lines bufnr 0 -1 false)
                                    (a.map-indexed (fn [[idx line]] [idx line]))
                                    (lib.reverse)
                                    (lib.take-while (fn [[idx line]] (a.empty? line)))
                                    (a.map a.first))]
    (each [index line-index (ipairs blank-lines-end-buffer)]
      (remove-line bufnr (a.dec line-index)))))

(defn remove-empty-lines-end-current-buffer []
  "Removes all empty lines at the end of the current buffer."
  (remove-empty-lines-end-buffer 0))

(defn trim-whitespace []
  "Trims whitespace from the current buffer.
  Also removes empty lines at the end of the buffer."
  (nvim.command "%substitute/\\s\\+$//e")
  (remove-empty-lines-end-current-buffer))

(defn toggle-parinfer
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

(comment
  ;; Try this from the REPL by adding empty line at the end of this file
  (remove-empty-lines-end-current-buffer))
