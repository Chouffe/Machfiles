call plug#begin('~/.vim/plugged')

" Allowing you to easily write plugins or configuration in a Clojure-like Lisp with great runtime performance.
Plug 'Olical/aniseed', { 'tag': 'v3.20.0' }
" Comment out stuff
Plug 'tpope/vim-commentary'
" Readline style insertion
Plug 'tpope/vim-rsi'
" Heuristically set buffer options
Plug 'tpope/vim-sleuth'
" Helpers for Linux
Plug 'tpope/vim-eunuch'
" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" Pairs of handy bracket mapping
Plug 'tpope/vim-unimpaired'
" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'
" Project configuration
Plug 'tpope/vim-projectionist'
" Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'
" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Continuously updated session files (to be used with tmux resurect)
Plug 'tpope/vim-obsession'
" The fancy start screen for Vim
Plug 'mhinz/vim-startify'
" Align with ease
Plug 'junegunn/vim-easy-align'
" A collection of common configurations for Neovim's built-in language server client
Plug 'neovim/nvim-lspconfig'
" Adds the missing :LspInstall <language> command to conveniently install language servers
Plug 'kabouzeid/nvim-lspinstall'
" Auto completion for nvim
Plug 'hrsh7th/nvim-compe'
" Icons as well as colors for each icon.
Plug 'kyazdani42/nvim-web-devicons'
" Simple and easy way to use the interface for tree-sitter in Neovim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Provides yanking highlighting feedback
Plug 'machakann/vim-highlightedyank'
" Improved incremental searching
Plug 'haya14busa/incsearch.vim'
" Provides improved * motions
Plug 'haya14busa/vim-asterisk'
" Place, toggle and display marks.
Plug 'kshenoy/vim-signature'
" Open URI with your favorite browser - fix gx in nvim
Plug 'tyru/open-browser.vim'

" Telescope: Fuzzy finder over lists {{{
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" }}}

" FZF: Fuzzy finder over lists {{{
Plug 'junegunn/fzf',  { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
" }}}

" Expand region
Plug 'terryma/vim-expand-region'
" Rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'
" vim over: :substitute preview
Plug 'osyo-manga/vim-over'
" Nerdtree
Plug 'preservim/nerdtree'
" Neomake
Plug 'neomake/neomake'

" Clojure {{{
Plug 'Olical/conjure', {'tag': 'v4.21.0'}
" Plug 'tpope/vim-fireplace', { 'for': 'clojure', 'tag': 'v2.1' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
" Plug 'honza/vim-clojure-conceal', { 'for' : 'clojure' }
Plug 'guns/vim-sexp', { 'for': ['clojure', 'scheme', 'fnl', 'fennel'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for' : ['clojure', 'scheme', 'fennel', 'fnl'] }
" Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Clojure runtime files
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" provides a repl that supports breakpoints, documentation lookup, source code
" navigation, and omnicompletion.
" Plug 'dgrnbrg/vim-redl', { 'for': 'clojure' }
" Plug 'dgrnbrg/redl', { 'for': 'clojure' }
" static support for Leiningen and Boot
Plug 'tpope/vim-salve', { 'for': 'clojure' }
" the Clojure formatting tool.
" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
" Parinfer - requirement: rust and cargo installed
" https://www.rust-lang.org/tools/install and add bin path to $PATH
Plug 'eraserhd/parinfer-rust', { 'do': 'cargo build --release', 'for': ['clojure', 'fennel', 'fnl'] }
" }}}

" Python {{{
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'python/black', { 'for': 'python' }
Plug 'psf/black', { 'for': 'python', 'branch': 'stable' }
" Executes Black on save if it exists
autocmd BufWritePre *.py if exists(":Black") | execute ":Black" | endif
" }}}

" Html/Xml {{{
Plug 'tpope/vim-ragtag', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': 'html' }
" }}}

" CSS {{{

Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss'] }
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'lambdalisue/vim-gita'
" }}}

" Minimalist status/tabline for vim
Plug 'itchyny/lightline.vim'

" Tmux {{{
" Vim tmux integration
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
" }}}

" Objects and Motions {{{

" Editing keys
" e for entire file
" i for indent level
" l for current line
" u for url
" b for any block type (parens, braces, quotes, ltgt)
" = and i= for conflicts marked blocks
" f for function (c, java, js, php, vim only)
" i,/a, for function parameter
" r for a block in ruby
" f,c for function and class in python
" c for css class
"
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'mattn/vim-textobj-url'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'rhysd/vim-textobj-conflict'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'bps/vim-textobj-python'
Plug 'jasonlong/vim-textobj-css'
" }}}

" Colorschemes {{{
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
" }}}

call plug#end()

" vim:foldmethod=marker:foldlevel=0
