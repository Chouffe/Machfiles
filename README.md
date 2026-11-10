# Machfiles

## Installing

You will need `git` and GNU `stow`

Clone into your `$HOME` directory or `~`

```bash
git clone https://github.com/Chouffe/Machfiles.git ~
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README)
```

```bash
stow zsh # Just my zsh config
```

Turn on the secret-scanning git hooks, once per clone (needs [mise](https://mise.jdx.dev)):

```bash
mise trust
mise run setup    # installs gitleaks and sets core.hooksPath to .githooks
```

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

## Programs

An updated list of all the programs I use can be found in the `programs` directory
