function init-dotfiles
    mkdir -p "$HOME/.dotfiles"
    git init --bare "$HOME/.dotfiles"
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" branch -M main
end

