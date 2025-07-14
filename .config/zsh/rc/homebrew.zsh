# Configure Homebrew
if command -v brew &> /dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    export HOMEBREW_CASK_OPTS='--no-quarantine'
    export HOMEBREW_NO_ENV_HINTS=1
    export HOMEBREW_NO_EMOJI=1

    alias brew-cleanup='brew autoremove; brew cleanup --prune=all; brew cleanup -s'
    alias brew-upgrade='brew update; brew upgrade'
    alias brew-backup='brew bundle dump --file=~/.config/brew/Brewfile --force'

    if [ -f "$HOME/.config/brew/Brewfile" ]; then
        alias brew-restore='brew bundle --file=~/.config/brew/Brewfile --force'
    fi
fi
