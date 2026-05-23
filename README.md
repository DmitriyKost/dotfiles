## Setup

Clone the repo as a bare repository:

```sh
git clone --bare git@github.com:DmitriyKost/dotfiles.git "$HOME/.dotfiles"
```

Create an alias:

```sh
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Hide untracked files from status:

```sh
dotfiles config --local status.showUntrackedFiles no
```

Checkout the files:

```sh
dotfiles checkout
```

If checkout fails because files already exist, back them up first:

```sh
mkdir -p ~/.dotfiles-backup

dotfiles checkout 2>&1 | grep -E '^\s+' | awk '{print $1}' | while read -r file; do
  mkdir -p "$HOME/.dotfiles-backup/$(dirname "$file")"
  mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
done

dotfiles checkout
```

## Useful commands

Show tracked files:

```sh
dotfiles ls-files
```

Remove a file from the repo but keep it locally:

```sh
dotfiles rm --cached path/to/file
dotfiles commit -m "Stop tracking file"
