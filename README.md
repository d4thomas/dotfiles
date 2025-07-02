# Dotfiles Management

This script sets up and restores dotfiles using a bare Git repository.

## Setup

Add the following function definitions to your shell configuration file (e.g., `.bashrc` or `.zshrc`).

```sh
# Setup dotfiles maintenance
if command -v git &> /dev/null; then
    dotfiles() {
        GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git "$@"
    }
    init-dotfiles() {
        mkdir -p "$HOME/.dotfiles"
        git init --bare "$HOME/.dotfiles"
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckout true
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckoutCone false
        mkdir -p "$HOME/.dotfiles/info"
        printf "/*\n!README.md\n" > "$HOME/.dotfiles/info/sparse-checkout"
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" sparse-checkout reapply
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" branch -M main
    }
    rest-dotfiles() {
        if [ -z "$1" ]; then
            echo "Usage: rest-dotfiles <github-repo-url>"
            return 1
        fi
        git clone --bare "$1" "$HOME/.dotfiles"
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckout true
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config core.sparseCheckoutCone false
        mkdir -p "$HOME/.dotfiles/info"
        printf "/*\n!README.md\n" > "$HOME/.dotfiles/info/sparse-checkout"
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout -f
    }
fi
```

## Commands

### init-dotfiles

Initializes a bare Git repository in `$HOME/.dotfiles` and sets up sparse-checkout to exclude `README.md`.

Usage:

```sh
init-dotfiles
```

### rest-dotfiles

Restores dotfiles from a remote Git repository into `$HOME`.

Usage:

```sh
rest-dotfiles <github-repo-url>
```

### dotfiles

A helper function to interact with the dotfiles repository.

Usage:

```sh
dotfiles status
dotfiles add files
dotfiles commit -m "message"
dotfiles push -u origin main
```
