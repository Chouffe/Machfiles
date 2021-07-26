(module dotfiles.general.functions
  {autoload {nvim conjure.aniseed.nvim
             u dotfiles.general.utils
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

(comment
  (highlight-at-colorcolumn))
