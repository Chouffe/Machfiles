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
  (toggle-parinfer))
