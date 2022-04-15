(module config.general.functions
  {autoload {nvim conjure.aniseed.nvim
             u config.general.utils
             a aniseed.core}})

;; --------------------------
;; Some missing lib functions
;; --------------------------

(defn reverse [coll]
  "Returns a collection of the items in coll in reverse order."
  (if (a.empty? coll)
    coll
    (a.concat
      (reverse (a.rest coll))
      [(a.first coll)])))

(comment
  (reverse [1 2 3 4])

  ;; Insert in a table
  (let [t [1 2 3]]
    (table.insert t 4)
    t))

(defn take-while [pred coll]
  "Returns a coll of successive items from coll while
  (pred item) returns logical true. pred must be free of side-effects."
  (. (a.reduce (fn [{: ys : done?} x]
                 (if
                   done? {:ys ys :done? true}
                   (pred x) {:ys (a.concat ys [x]) :done? false}
                   :else {:ys ys :done? true}))
            {:done? false :ys []}
            coll)
     :ys))

(comment
  (take-while a.string? ["hello" "world" 42 43]))

;; ----------------------------
;; End of missing lib functions
;; ----------------------------

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

(defn remove-line [bufnr idx]
  "Remove the line at index `idx` in buffer `bufnr`. 0 for current buffer."
  (nvim.buf_set_lines bufnr idx (a.inc idx) true []))

(defn remove-empty-lines-end-buffer [bufnr]
  "Removes all empty lines at the end of buffer `bufnr`."
  (let [blank-lines-end-buffer (->> (nvim.buf_get_lines bufnr 0 -1 false)
                                    (a.map-indexed (fn [[idx line]] [idx line]))
                                    (reverse)
                                    (take-while (fn [[idx line]] (a.empty? line)))
                                    (a.map a.first))]
    (each [index line-index (ipairs blank-lines-end-buffer)]
      (remove-line bufnr (a.dec line-index)))))

(defn remove-empty-lines-end-current-buffer []
  "Removes all empty lines at the end of the current buffer."
  (remove-empty-lines-end-buffer 0))

(defn trim_whitespace []
  "Trims whitespace from the current buffer.
  Also removes empty lines at the end of the buffer."
  (nvim.command "%substitute/\\s\\+$//e")
  (remove-empty-lines-end-current-buffer))

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

(comment
  ;; Try this from the REPL by adding empty line at the end of this file
  (remove_empty_lines_end_current_buffer))
