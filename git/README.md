# git

## Install

```bash
mkdir -p ~/.config   # see step 3 of the main README
cd ~/Machfiles
stow git
```

This links `~/.gitconfig`, `~/.gitignore` and `~/.config/git/allowed_signers`. The files are named `dot-gitconfig` and `dot-gitignore` in the repo. The `.stowrc` at the repo root turns on `--dotfiles`, which makes stow link `dot-` files as `.` files, so run stow from the repo root.

On a machine set up before the rename, `~/.gitconfig` and `~/.gitignore` are links renamed by hand that now point to missing files. Remove them, deleting only symlinks so a real file is never lost, then stow again:

```bash
for f in ~/.gitconfig ~/.gitignore ~/gitconfig ~/gitignore; do
  if [ -L "$f" ]; then rm -v "$f"; fi
done
cd ~/Machfiles && stow -R git
```

If stow then reports a conflict, that path is a real file. Look at it, and back it up before moving it out of the way.

## Needs

- [delta](https://github.com/dandavison/delta): the pager and the interactive diff filter
- [git-lfs](https://git-lfs.com)
- gpg with the signing key on the YubiKey (see [`programs/setup.md`](../programs/setup.md))

## Commit signatures

`commit.gpgsign` is on, so every commit is signed:

- Commits made on the host are GPG-signed with `user.signingkey`.
- Commits made by agents in sandboxes are SSH-signed with the hardware key.

Git checks SSH signatures against `~/.config/git/allowed_signers`, so `git log --show-signature` verifies both kinds. The file holds only a public key. Keep it in sync with `user.signingkey` in agents-sandboxes' `sbxenv.global.yaml`.
