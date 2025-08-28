# Dotfiles Management

## Initialize

```sh
mkdir -p "$HOME/.dotfiles"
git init --bare "$HOME/.dotfiles"
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckout true
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckoutCone false
mkdir -p "$HOME/.dotfiles/info"
printf "/*\n!README.md\n" > "$HOME/.dotfiles/info/sparse-checkout"
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" sparse-checkout reapply
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" branch -M main
```

## Alias Command
```sh
GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git 
```

## Restore
```sh
git clone --bare <git-repository> "$HOME/.dotfiles"
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckout true
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckoutCone false
mkdir -p "$HOME/.dotfiles/info"
printf "/*\n\!README.md\n" > "$HOME/.dotfiles/info/sparse-checkout"
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout -f
```
