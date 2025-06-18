# Configure Zsh History
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# Configure Homebrew
if command -v brew &> /dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    export HOMEBREW_CASK_OPTS='--no-quarantine'
    export HOMEBREW_NO_ENV_HINTS=1
    export HOMEBREW_NO_EMOJI=1
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

# Configure Zsh auto pairs
if [ -f "$(brew --prefix)/share/zsh-autopair/autopair.zsh" ]; then
    source "$(brew --prefix)/share/zsh-autopair/autopair.zsh"
fi

# Configure Starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
    export VIRTUAL_ENV_DISABLE_PROMPT=1
else
    autoload -U colors && colors
    local success="%{$fg[green]%}❯%{$reset_color%}"
    local error="%{$fg[red]%}❯%{$reset_color%}"
    build_prompt() {
        local newline=$'\n'
        local dir="%{$fg[blue]%}%~%{$reset_color%}"
        PROMPT="${dir}${newline}${1} "
    }
    precmd() {
    if [[ $? -eq 0 ]]; then
        build_prompt "${success}"
    else
        build_prompt "${error}"
    fi
    }
    build_prompt "${success}"
fi

# Disable less history file
export LESSHISTFILE=-

# Set aliases
alias grep='grep --color=always'
alias less='less -R'
alias cliconcache='sudo rm -r /Library/Caches/com.apple.iconservices.store; killall Finder'
alias man="env LESS_TERMCAP_mb=$'\e[31m' \
               LESS_TERMCAP_md=$'\e[34m' \
               LESS_TERMCAP_me=$'\e[0m' \
               LESS_TERMCAP_se=$'\e[0m' \
               LESS_TERMCAP_so=$'\e[43;30m' \
               LESS_TERMCAP_ue=$'\e[0m' \
               LESS_TERMCAP_us=$'\e[36m' man"
alias rmgk='xattr -r -d com.apple.quarantine'
if command -v eza &> /dev/null; then
    HIDDEN=".DS_Store"
    alias ls='eza --no-quotes --ignore-glob="$HIDDEN"'
    alias lsa='eza -a'
    alias lsg='eza --no-quotes --group-directories-first --ignore-glob="$HIDDEN"'
    alias lst='eza --no-quotes --long --classify --all --header --git --no-user --tree --ignore-glob="$HIDDEN" --git --level'
else
    alias ls='ls --color=always'
fi
if command -v trash &> /dev/null; then
    alias rm='trash'
fi

# Search functions
fdf() {
  if [ -z "$1" ]; then
    echo "Usage: fdf <name_pattern>"
    return 1
  fi
  find . -path ./.git -prune -o -print | grep -i "$*"
}
fdt() {
  if [ -z "$1" ]; then
    echo "Usage: fdt <search_term>"
    return 1
  fi
  grep -rIH --exclude-dir=".git" "$*" . 2>/dev/null
}

# Setup dot files maintenance
if command -v git &> /dev/null; then
    dotfiles() {
        GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git "$@"
    }

    init-dotfiles() {
        mkdir -p "$HOME/.dotfiles"
        git init --bare "$HOME/.dotfiles"
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" branch -M main
    }

    rest-dotfiles() {
        if [ -z "$1" ]; then
            echo "Usage: rest-dotfiles <github-repo-url>"
            return 1
        fi

        git clone --bare "$1" "$HOME/.dotfiles"
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout -f
    }
fi
