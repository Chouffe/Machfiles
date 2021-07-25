(module dotfiles.general.functions
  {autoload {nvim conjure.aniseed.nvim
             a aniseed.core}})

(defn empty? [x]
  (or (= x nil) (= x "") (= x 0)))

(defn toggle_highlight_at_colorcolumn []
  "Toggles the color specified by colorcolumn."
  (let [colorcolumn nvim.o.colorcolumn
        textwidth nvim.o.textwidth]
    (if
      (and (empty? colorcolumn)
           (empty? textwidth))
      (set vim.o.colorcolumn "80")

      (and (empty? colorcolumn)
           (not (empty? textwidth)))
      (set vim.o.colorcolumn "+1")

      (set vim.o.colorcolumn ""))))

(comment
  (highlight-at-colorcolumn))
