# Machfiles

My dotfiles, one [GNU stow](https://www.gnu.org/software/stow/) package per program.

## Setting up a new machine

1. Install `git` and `stow` 2.4 or newer. This repo uses stow's `--dotfiles` option, and older versions don't handle it fully. Only 2.4.1 has been tested. Debian bookworm and Ubuntu 24.04 ship 2.3.1.
2. Clone the repo into a folder in `$HOME`. Stow links into the parent of the folder it runs from, so this is what puts the links in `~`:

   ```bash
   git clone https://github.com/Chouffe/Machfiles.git ~/Machfiles
   cd ~/Machfiles
   ```

3. Stow the packages this machine needs (see [Packages](#packages)):

   ```bash
   mkdir -p ~/.config
   # Linux desktop (niri + DMS)
   stow zsh git nvim tmux ghostty alacritty niri dms direnv tig ranger
   ```

   Create `~/.config` first. If it doesn't exist, stow can link the whole folder into a single package, such as `~/.config` → `Machfiles/git/.config`. Every program would then write its config into the repo.

   Don't run `stow */`. It also links `programs/` (notes, not config) into `~`, along with the legacy packages.

   Stow refuses to overwrite a file that already exists, such as the default `~/.zshrc`. Move that file out of the way and run the command again.

4. Read the notes for the packages that have them (what they need installed, first-run steps):
   - `git`: see [`git/README.md`](git/README.md)
   - `nvim`: see [`nvim/README.md`](nvim/README.md)
5. Turn on the secret-scanning git hooks (needs [mise](https://mise.jdx.dev)):

   ```bash
   mise trust
   mise run setup    # installs gitleaks and sets core.hooksPath to .githooks
   ```

6. Install the programs and do the system setup in [`programs/`](programs): `deps.list` lists the programs to install, and `setup.md` covers the YubiKey, pass, fonts and keyboard.

Remove a package's links with `stow -D <package>`. Run stow from the repo root so it picks up [`.stowrc`](.stowrc), which links files named `dot-foo` as `.foo`.

## Packages

| Package | What it configures | Platform | Status |
|---|---|---|---|
| `zsh` | zsh with oh-my-zsh, plus aliases, functions and `PATH` | any | current |
| `git` | git config, global gitignore, signing keys | any | current |
| `nvim` | Neovim in Fennel (lazy.nvim + aniseed) | any | current |
| `tmux` | tmux and its status bar | any | current |
| `ghostty` | Ghostty terminal | any | current |
| `alacritty` | Alacritty terminal and themes | any | current |
| `direnv` | direnv helpers | any | current |
| `tig` | tig, the git TUI | any | current |
| `ranger` | ranger file manager | any | current |
| `niri` | niri, a scrolling Wayland compositor | Linux | current |
| `dms` | DankMaterialShell, the bar and shell for niri | Linux | current |
| `regolith` | Regolith 2 (i3) desktop and wallpapers | Linux, X11 | legacy |
| `x` | X11 resources and `.xprofile` | Linux, X11 | legacy |
| `rofi` | rofi-pass | Linux, X11 | legacy |
| `yabai` | yabai tiling window manager | macOS | legacy |
| `skhd` | skhd hotkeys for yabai | macOS | legacy |
| `conda` | `.condarc` | any | legacy |
| `lein` | Leiningen profiles | any | legacy |

"Legacy" means I haven't used it on a recent machine. It's kept for reference.

`programs/` is not a stow package. It holds the install list and the setup notes.

## Secret scanning

This repo is public, so anything pushed is public at once. It may hold names, emails and public keys, never a private key, token, password or cloud credential. [gitleaks](https://github.com/gitleaks/gitleaks) checks that, in three places:

| When | What it scans | Where |
|---|---|---|
| `git commit` | The staged changes | [`.githooks/pre-commit`](.githooks/pre-commit) |
| `git push` | Every commit being pushed, including ones made with `--no-verify` | [`.githooks/pre-push`](.githooks/pre-push) |
| Every PR, and every push to `master` | The full history | [`.github/workflows/secret-scan.yml`](.github/workflows/secret-scan.yml) |

All three use the gitleaks version pinned in [`mise.toml`](mise.toml) and the rules in [`.gitleaks.toml`](.gitleaks.toml): gitleaks' default rules (private keys, GitHub tokens, AWS access keys, ...) plus one that matches AWS secret keys and session tokens by name. If gitleaks isn't installed, the hooks refuse the commit or push instead of skipping the check. GitHub's own secret scanning and push protection are on too, and they also cover pushes from a clone without the hooks.

**If it finds something:**

1. Treat the secret as leaked, even if it was never pushed, and rotate it first: revoke the token or key, then create a new one.
2. If the commit hasn't been pushed, amend it or reset it away.
3. If it has been pushed, rewrite history with [`git filter-repo`](https://github.com/newren/git-filter-repo) and force-push. Forks, clones and GitHub's caches may still have it, which is why rotating comes first.
4. If it's a false positive, add a narrow allowlist entry to `.gitleaks.toml` that matches the whole value. Don't disable a rule, and don't use a `gitleaks:allow` comment: it hides every secret on that line.

To scan the whole history by hand: `gitleaks git --config .gitleaks.toml .`
