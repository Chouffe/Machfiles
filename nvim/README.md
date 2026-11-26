# nvim

Neovim config written in [Fennel](https://fennel-lang.org), compiled at startup by [aniseed](https://github.com/Olical/aniseed). Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

## Install

```bash
mkdir -p ~/.config   # see step 3 of the main README
cd ~/Machfiles
stow nvim
nvim
```

On first start, `init.lua` clones lazy.nvim and aniseed into `~/.local/share/nvim/lazy`. lazy.nvim then installs the plugins at the versions pinned in `lazy-lock.json`, and mason installs the LSP servers. Restart nvim once that finishes.

## Needs

- A recent Neovim
- `git`, to clone the plugins
- [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`), for the telescope pickers
- A [Nerd Font](https://www.nerdfonts.com), for the icons
- Whatever the mason-installed servers need to run, such as `node` and `python`

## Layout

All paths are under `.config/nvim/`.

| Path | What's there |
|---|---|
| `init.lua` | Bootstraps lazy.nvim and aniseed, then sources `viml/init.vim` |
| `fnl/config/init.fnl` | Entry point: loads the plugins, autocommands, user commands, keys, debugging and diagnostics |
| `fnl/config/plugins.fnl` | The plugin list (lazy.nvim specs) |
| `fnl/config/plugin/` | Per-plugin config, one file each |
| `fnl/config/keys/` | Keymaps. Leader is `space`, local leader is `,` (set in `fnl/config/constants.fnl`) |
| `fnl/config/lsp/core.fnl` | LSP servers: which ones mason installs and which ones are enabled |
| `fnl/lib/` | Shared Fennel helpers and macros |
| `viml/` | Settings and filetypes still in Vimscript |
| `lazy-lock.json` | Pinned plugin versions. Commit it after `:Lazy update` |

## Common tasks

- Add a plugin: add a spec to `fnl/config/plugins.fnl`. If it needs config, add a file in `fnl/config/plugin/` and reference it with `:config (. (require :config.plugin.<name>) :config)`.
- Update plugins: `:Lazy update`, then commit `lazy-lock.json`.
- Add an LSP server: add it to `fnl/config/lsp/core.fnl`.
