(module config.plugin.theme
  {autoload {theme github-theme}})

(defn setup []
  (theme.setup {:theme_style "dark"
                :comment_style "italic"}))

; (setup)
