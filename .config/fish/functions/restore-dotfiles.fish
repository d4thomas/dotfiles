function restore-dotfiles
    if not set -q argv[1]
        echo 'Usage: restore-dotfiles <github-repo-url>'
        return 1
    end

    git clone --bare $argv[1] "$HOME/.dotfiles"
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout -f
end
