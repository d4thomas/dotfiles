# Configure dotfiles maintenance
if command -v git &> /dev/null; then
    dfs() {
        GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git "$@"
    }

    dfs-init() {
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

    dfs-restore() {
        if [ -z "$1" ]; then
            echo "Usage: dfs-restore <github-repo-url>"
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

    dfss() { GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git status }
    dfsd() { GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git diff }
    dfsa() { GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git add -u }
    dfsp() { GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git push -u origin main } 
    dfsc() {
        if [ $# -eq 0 ]; then
            echo "Usage: dfsc <commit message>"
            return 1
        fi
        dfs commit -m "$*"
    }
fi