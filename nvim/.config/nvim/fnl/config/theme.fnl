(local nvim (require :aniseed.nvim))

(fn disable-background-color-erase []
  "Disable BCE so that color schemes render properly when inside 256-color tmux
  and GNU screen. See also http://snk.tuxfamily.org/log/vim-256color-bce.html"
  (when (string.find nvim.o.term "256color")
    (set nvim.o.background :dark)))

(fn config []
  (let [ ; material-functions (require :material.functions)
        ; material (require :material)
        lualine (require :lualine)]
    (nvim.ex.set :termguicolors)     ;; True color support (will work only in tmux)
    (set nvim.o.t_Co "256")            ;; Number of colors used in terminal
    ; (set nvim.o.t_Co 256)            ;; Number of colors used in terminal
    (disable-background-color-erase)
    (set nvim.o.background :dark)    ;; Set the background as dark

    ;; set the gruvbox coloscheme
    ;; ------------------------------
    ; (nvim.command "colorscheme gruvbox")

    ;; Set the material colorscheme
    ;; ------------------------------
    ; (nvim.command "colorscheme material")
    ; (material-functions.change_style "palenight")
    ; (material.setup {:lualine_style :stealth})
    ; (lualine.setup {:options {:theme :material}})

    ; (material-functions.change_style "darker")
    ; (material-functions.change_style "deep ocean")
    ; set the hybrid material colorscheme
    ; (nvim.command "colorscheme hybrid_material")

    ;; Set tokyonight as colorscheme
    ;; ------------------------------
    (nvim.command "colorscheme tokyonight-moon")
    (lualine.setup {:options {:theme :tokyonight}})
    ;; Make the background color transparent
    (nvim.ex.highlight :Normal :guibg=None :ctermbg=NONE)
    (nvim.ex.set :cursorline)               ;; highlight the line you are on
    (nvim.ex.set :cursorline :cursorcolumn) ;; highlight the column you are on
    (nvim.ex.highlight :clear :SignColumn)))

{: config}
