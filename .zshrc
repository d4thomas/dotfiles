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
    alias brew-cleanup='brew autoremove; brew cleanup --prune=all; brew cleanup -s'
    alias brew-upgrade='brew upgrade; brew-cleanup'
    if [ -f "$HOME/.config/brew/Brewfile" ]; then
        alias brew-restore='brew bundle --file=~/.config/brew/Brewfile --force'
    fi
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

# Configure prompt
if [ -f "$(brew --prefix)/share/zsh/site-functions/prompt_pure_setup" ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=12
    PURE_GIT_UP_ARROW="▲"
    PURE_GIT_DOWN_ARROW="▼"
    PURE_GIT_STASH_SYMBOL="☰"
    zstyle :prompt:pure:git:stash show yes
    zstyle :prompt:pure:git:dirty color magenta
    zstyle :prompt:pure:prompt:success color green
    zstyle :prompt:pure:prompt:continuation color green
    autoload -U promptinit; promptinit
    prompt pure
elif command -v starship &> /dev/null; then
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
alias rmgk='xattr -r -d com.apple.quarantine'
alias cliconcache='sudo rm -r /Library/Caches/com.apple.iconservices.store; killall Finder'
alias man="env LESS_TERMCAP_mb=$'\e[31m' \
               LESS_TERMCAP_md=$'\e[34m' \
               LESS_TERMCAP_me=$'\e[0m' \
               LESS_TERMCAP_se=$'\e[0m' \
               LESS_TERMCAP_so=$'\e[43;30m' \
               LESS_TERMCAP_ue=$'\e[0m' \
               LESS_TERMCAP_us=$'\e[36m' man"
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

# Zsh history toggle function
togglehist() {
    if [[ -n "$HISTFILE" ]]; then
        export _OLD_HISTFILE="$HISTFILE"
        unset HISTFILE
        echo "History Disabled"
    else
        export HISTFILE="${_OLD_HISTFILE}"
        echo "History Enabled"
    fi
}

# Search functions
fdf() {
    if [ -z "$1" ]; then
        echo "Usage: fdf <name_pattern>"
        return 1
    fi
    find . -path ./.git -prune -o -print 2>/dev/null | grep -i "$*"
}
fdt() {
    if [ -z "$1" ]; then
        echo "Usage: fdt <search_term>"
        return 1
    fi
    grep -rIH --exclude-dir=".git" "$*" . 2>/dev/null
}

# Function to toggle SDK manager
if [ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    sdkman() {
        local sdkman_init="$HOME/.sdkman/bin/sdkman-init.sh"
        if [[ "$1" == "enable" ]]; then
            export ORIGINAL_JAVA_HOME=$(/usr/libexec/java_home)
            export SDKMAN_DIR="$HOME/.sdkman"
            [[ -s "$sdkman_init" ]] && source "$sdkman_init"
        elif [[ "$1" == "disable" ]]; then
            if [[ -n "$ORIGINAL_JAVA_HOME" ]]; then
                export JAVA_HOME="$ORIGINAL_JAVA_HOME"
                unset ORIGINAL_JAVA_HOME
                hash -r
            fi
            unset SDKMAN_DIR
            unset SDKMAN_VERSION
            unset SDKMAN_CANDIDATES_API
            unset SDKMAN_CURRENT_API
            unset SDKMAN_PLATFORM
        else
            echo "Usage: sdkman [enable|disable]"
            return 1
        fi
    }
fi

# Setup dotfiles maintenance
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
    dfss() { dfs status }
    dfsd() { dfs diff }
    dfsa() { dfs add -u }
    dfsp() { dfs push -u origin main }
    dfsc() {
        if [ -z "$*" ]; then
            echo "Usage: dfsc 'commit message'"
            return 1
        fi
        dotfiles commit -m "$*"
    }
fi
