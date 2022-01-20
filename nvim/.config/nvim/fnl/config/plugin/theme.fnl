(module config.plugin.theme
  {autoload {a aniseed.core
             theme github-theme
             nvim aniseed.nvim}})

(defn- disable-background-color-erase
  []
  "Disable BCE so that color schemes render properly when inside 256-color tmux
  and GNU screen. See also http://snk.tuxfamily.org/log/vim-256color-bce.html"
  (when (string.find nvim.o.term "256color")
    (set nvim.o.background :dark)))

; (defn setup []
;   (theme.setup {:theme_style "dark"
;                 :comment_style "italic"}))

(defn setup []
  (nvim.ex.set :termguicolors)     ;; True color support (will work only in tmux)
  (set nvim.o.t_Co 256)            ;; Number of colors used in terminal
  (disable-background-color-erase)
  (set nvim.o.background :dark)    ;; Set the background as dark
  ;; set the gruvbox coloscheme
  (nvim.command "colorscheme gruvbox")
  ; set the hybrid material colorscheme
  ; (nvim.command "colorscheme hybrid_material")
  ;; Make the background color transparent
  (nvim.ex.highlight :Normal :guibg=None :ctermbg=NONE)
  (nvim.ex.set :cursorline)               ;; highlight the line you are on
  (nvim.ex.set :cursorline :cursorcolumn) ;; highlight the column you are on
  (nvim.ex.highlight :clear :SignColumn))


(setup)
