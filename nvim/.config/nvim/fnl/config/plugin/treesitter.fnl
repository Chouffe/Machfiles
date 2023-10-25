(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(defn config []
  (treesitter.setup 
    {:highlight {:enable true}
     :rainbow {:enable true
               ;; List of languages you want to disable the plugin for
               ; :disable [:cpp]
               ;; Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
               :extended_mode true
               ;; Do not enable for files with more than n lines, int
               :max_file_lines nil}
     :indent {:enable true}
     :ensure_installed ["bash"
                        "c"
                        "clojure" 
                        "diff"
                        "fennel" 
                        "go" 
                        "html"
                        "javascript"
                        "jsdoc"
                        "json"
                        "jsonc"
                        "lua"
                        "lua" 
                        "luadoc"
                        "luap"
                        "markdown"
                        "markdown_inline"
                        "python"
                        "python" 
                        "query"
                        "regex"
                        "toml"
                        "tsx"
                        "typescript"
                        "vim"
                        "vimdoc"
                        "yaml"]}))
     

                        
