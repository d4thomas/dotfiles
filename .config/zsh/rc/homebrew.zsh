# Configure Homebrew
if command -v brew &> /dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    export HOMEBREW_NO_ENV_HINTS=1
    export HOMEBREW_NO_EMOJI=1
    export HOMEBREW_NO_ANALYTICS=1

    alias bbd="brew bundle dump --no-vscode --file=~/.config/brew/Brewfile --force"
    if [ -f "$HOME/.config/brew/Brewfile" ]; then
        alias bbr="brew bundle --file=~/.config/brew/Brewfile --force"
    fi
    alias bb="brew update; brew upgrade; brew cleanup --prune=all; bbd"
fi
