# Configure Homebrew
if command -v brew &> /dev/null; then
    # Add autocomletions
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    # Setup preferences
    export HOMEBREW_NO_ENV_HINTS=1
    export HOMEBREW_NO_EMOJI=1

    # Add aliases
    alias brew-backup='brew bundle dump --file=~/.config/brew/Brewfile --force'
    alias brew-restore='brew bundle --file=~/.config/brew/Brewfile --force'
    alias brew-cleanup='brew autoremove; brew cleanup --prune=all; brew cleanup -s'
    alias brew-upgrade='brew upgrade; brew-cleanup'
fi

# Configure Zsh autocompletion
if [ -d "$(brew --prefix)/share/zsh-completions" ]; then
    FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
fi
autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true

# Configure Zsh autosuggestions
if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Configure Zsh syntax highlighting
if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    (( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
        ZSH_HIGHLIGHT_STYLES[path]=none
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=none
        ZSH_HIGHLIGHT_STYLES[path_prefix]=none
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=none
        ZSH_HIGHLIGHT_STYLES[precommand]=none
fi

# Configure Starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
    # Let Starship handle virtual environment status
    export VIRTUAL_ENV_DISABLE_PROMPT=1
fi

# Configure LS_COLORS
# if command -v vivid &> /dev/null; then
    export LS_COLORS="$(vivid generate github-light-default)"
# fi

# Configure fzf
if command -v fzf &> /dev/null; then
    # Setup keybindings: CTRL-t (fzf), CTRL-r (shell), Option-c (cd ...)
    eval "$(fzf --zsh)"

    # Configure color theme
    export FZF_DEFAULT_OPTS="
        --layout=reverse-list
        --info=inline
        --pointer=""
        --color=bg+:#d1d5da,bg:#ffffff,spinner:#be3535,hl:#be3535 \
        --color=fg:#4488f6,header:#be3535,info:#7a52d7,pointer:#be3535 \
        --color=marker:#9c76f1,fg+:#4488f6,prompt:#7a52d7,hl+:#be3535 \
        --color=selected-bg:#c3c7ce \
        --multi"
fi

# Configure bat
if command -v bat &> /dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    alias cat='bat -pp'
fi

# Clean home directory
export LESSHISTFILE=-
export GNUPGHOME="$HOME/.config/gnupg"

# Set aliases
if command -v eza &> /dev/null; then
    export EZA_CONFIG_DIR="$HOME/.config"
    HIDDEN=".DS_Store"
    alias ls='eza --no-quotes --ignore-glob="$HIDDEN"'
    alias lsa='eza -a'
    alias lsg='eza --no-quotes --group-directories-first --ignore-glob="$HIDDEN"'
    alias lst='eza --no-quotes --long --classify --all --header --git --no-user --tree --ignore-glob="$HIDDEN" --git --level'
fi
if command -v trash &> /dev/null; then
    alias rm='trash'
fi
if command -v rg &> /dev/null; then
    alias grep='rg'
fi

# Setup dot files maintenance
if command -v git &> /dev/null; then
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi

init-dotfiles() {
    mkdir -p "$HOME/.dotfiles"
    git init --bare "$HOME/.dotfiles"
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" branch -M main
}

restore-dotfiles() {
    if [ -z "$1" ]; then
        echo "Usage: init-dotfiles <github-repo-url>"
        return 1
    fi

    git clone --bare "$1" "$HOME/.dotfiles"
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout -f
}