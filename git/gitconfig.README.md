# README

* Installation instructions
```
stow git
mv gitconfig .gitconfig
mv gitignore .gitignore
```
* add the right email address in the config
```
[user]
    email = ***
```
* Commit signatures: host commits are GPG-signed (`signingkey`), while commits made
  by agents in sandboxes are SSH-signed with the hardware key. Git checks SSH
  signatures against `~/.config/git/allowed_signers` (linked by `stow git`), so
  `git log --show-signature` verifies both. The file holds only a public key; keep
  it in sync with `user.signingkey` in agents-sandboxes' `sbxenv.global.yaml`.
