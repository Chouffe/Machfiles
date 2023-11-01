(local nvim (require :aniseed.nvim))
(local lib (require :lib.core))
(local u (require :config.general.utils))
(local a (require :aniseed.core))

(fn toggle-highlight-at-colorcolumn []
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

; "Remove the line at index `idx` in buffer `bufnr`. 0 for current buffer."
(fn remove-line [bufnr idx]
  (nvim.buf_set_lines bufnr idx (a.inc idx) true []))

;  "Removes all empty lines at the end of buffer `bufnr`.")
(fn remove-empty-lines-end-buffer [bufnr]
  (let [blank-lines-end-buffer (->> (nvim.buf_get_lines bufnr 0 -1 false)
                                    (a.map-indexed (fn [[idx line]] [idx line]))
                                    (lib.reverse)
                                    (lib.take-while (fn [[_idx line]] (a.empty? line)))
                                    (a.map a.first))]
    (each [_index line-index (ipairs blank-lines-end-buffer)]
      (remove-line bufnr (a.dec line-index)))))

; "Removes all empty lines at the end of the current buffer."
(fn remove-empty-lines-end-current-buffer []
  (remove-empty-lines-end-buffer 0))

; "Trims whitespace from the current buffer.
;  Also removes empty lines at the end of the buffer."
(fn trim-whitespace []
  (nvim.command "%substitute/\\s\\+$//e")
  (remove-empty-lines-end-current-buffer))


; "Toggles Parinfer editing mode"
(fn toggle-parinfer
  []
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

; "Deletes the current buffer."
(fn delete_buffer []
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

{: toggle-highlight-at-colorcolumn
 : remove-line
 : remove-empty-lines-end-buffer
 : trim-whitespace
 : toggle-parinfer
 : delete_buffer}
