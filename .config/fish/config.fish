# Disable Fish greeting
set fish_greeting

# Set theme
fish_config theme choose Catppuccin\ Mocha

# Load Homebrew
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# Setup user specific environment
if test -d "$HOME/.local/bin"
    set -x PATH $HOME/.local/bin $PATH
end

# Setup Java environment
if test -d (brew --prefix)/opt/openjdk/bin
    set -x PATH (brew --prefix)/opt/openjdk/bin $PATH
end

# Setup dotNET environment
if test -d "$HOME/.dotnet/tools"
    set -x PATH $HOME/.dotnet/tools $PATH
end

# Configure Homebrew
if type -q brew
    # Setup preferences
    set -x HOMEBREW_NO_ENV_HINTS 1
    set -x HOMEBREW_NO_EMOJI 1

    # Add aliases
    alias brew-backup 'brew bundle dump --file=~/.config/brew/Brewfile --force'
    alias brew-restore 'brew bundle --file=~/.config/brew/Brewfile --force'
    alias brew-cleanup 'brew autoremove; brew cleanup --prune=all; brew cleanup -s'
    alias brew-upgrade 'brew upgrade; brew-cleanup'
end

# Configure Starship prompt
if type -q starship
    starship init fish | source

    # Let Starship handle virtual environment status
    set -x VIRTUAL_ENV_DISABLE_PROMPT 1
end

# Configure LS_COLORS
if type -q vivid
    set -x LS_COLORS "$(vivid generate catppuccin-mocha)"
end

# Configure fzf
if type -q fzf
    # Setup keybindings: CTRL-t (fzf), CTRL-r (shell), Option-c (cd ...)
    fzf --fish | source

    # Configure color theme
    set -x FZF_DEFAULT_OPTS "
        --layout=reverse-list
        --info=inline
        --pointer=""
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
        --color=selected-bg:#45475a \
        --multi"
end

# Configure bat
if type -q bat
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
    alias cat 'bat -pp'
end

# Clean home directory
set -x LESSHISTFILE -
set -x GNUPGHOME "$HOME/.config/gnupg"

# Set aliases
if type -q eza
    set HIDDEN ".DS_Store"
    alias ls 'eza --no-quotes --ignore-glob="$HIDDEN"'
    alias lsa 'eza --no-quotes -a'
    alias lsg 'eza --no-quotes --group-directories-first --ignore-glob="$HIDDEN"'
    alias lst 'eza --no-quotes --long --classify --all --header --git --no-user --tree --ignore-glob="$HIDDEN" --git --level'
end

if type -q trash
    alias rm 'trash'
end

if type -q rg
    alias grep 'rg'
end

# Setup dot files maintenance
if type -q git
    alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
end
