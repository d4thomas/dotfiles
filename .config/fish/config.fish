if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable the fish greeting message
set fish_greeting ""

# Load Homebrew
if type -q /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# Setup tmux environment
if test "$TERM_PROGRAM" = WezTerm
    if type -q tmux
        if not tmux attach -d >/dev/null 2>&1
            tmux new
        end
    end
end

# Configure Homebrew
if type -q brew
    # Add autocompletions
    set -gx FPATH (brew --prefix)/share/fish/vendor_completions.d $FPATH

    # Set environment variables
    set -x HOMEBREW_NO_ENV_HINTS 1
    set -x HOMEBREW_NO_EMOJI 1

    # Add aliases for backup/restore
    alias brew-backup 'brew bundle dump --file=~/.config/brew/Brewfile --force'
    alias brew-restore 'brew bundle --file=~/.config/brew/Brewfile'
end

# Enable autocompletion
if type -q fish_update_completions
    alias upd-comp fish_update_completions
end

# Setup user specific environment
if test -d "$HOME/.local/bin"
    set -x PATH $HOME/.local/bin $PATH
end

# Setup Ruby environment
if test -d /opt/homebrew/opt/ruby/bin
    # Ruby path
    set -x PATH /opt/homebrew/opt/ruby/bin $PATH

    # Ruby gems path
    set -x PATH (ruby -r rubygems -e 'puts Gem.dir')/bin $PATH
    set -x PATH (ruby -r rubygems -e 'puts Gem.user_dir')/bin $PATH

    # Environment manager
    if type -q rbenv
        rbenv init - | source
    end
end

# Setup Java environment
if test -d /opt/homebrew/opt/openjdk/bin
    set -x PATH /opt/homebrew/opt/openjdk/bin $PATH
    set -x CPPFLAGS -I/opt/homebrew/opt/openjdk/include
end

# Load Starship prompt
if type -q starship
    starship init fish | source
end

# Configure fzf
if type -q fzf
    # CTRL-t (fzf), CTRL-r (shell), Option-c (cd ...)
    fzf --fish | source

    # Set theme
    set -x FZF_DEFAULT_OPTS \
        "--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
    --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
end

# Set aliases
if type -q eza
    alias ls 'eza --icons --ignore-glob=".DS_Store|NOSYNC.tmp|go"'
    alias lst 'eza --long --classify --all --header --git --no-user --tree --icons --git --level'
end
if type -q nvim
    alias vi nvim
end
if type -q trash
    alias rm trash
end
if type -q bat
    alias cat 'bat -p'
end
