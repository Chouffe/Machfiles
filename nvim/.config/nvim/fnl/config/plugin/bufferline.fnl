(module config.plugin.bufferline
  {autoload {nvim aniseed.nvim
             bufferline bufferline}})

(defn config []
  (set nvim.o.termguicolors true)
  (bufferline.setup {}))
