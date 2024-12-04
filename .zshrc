# Setup TMUX environment
if [[ $TERM_PROGRAM = WezTerm ]]; then
  if command -v tmux &> /dev/null; then
    if ! tmux attach -d > /dev/null 2>&1; then
      tmux new
    fi
  fi
fi

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
fi

# Configure prompt (Starship)
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
  # Let Starship handle virtual environment status
  export VIRTUAL_ENV_DISABLE_PROMPT=1
fi

# Configure fzf
if command -v fzf &> /dev/null; then
  # Setup keybindings: CTRL-t (fzf), CTRL-r (shell), Option-c (cd ...)
  eval "$(fzf --zsh)"

  # Configure color theme
  BG="#1E1E2E"
  C1="#F9E2AF"
  C2="#F38BA8"
  C3="#F5C2E7"
  C4="#A6E3A1"
  C5="#89B4FA"
  C6="#94E2D5"

  export FZF_DEFAULT_OPTS="
    --layout=reverse-list
    --info=inline
    --pointer=""
    --color=fg:-1,bg:$BG,hl:$C1
    --color=fg+:,bg+:$BG,hl+:$C2
    --color=info:$C3,prompt:$C4,pointer:$C5
    --color=marker:$C2,spinner:$C6,header:-1"
fi

# Configure CoPilot CLI
if command -v gh &> /dev/null; then
  eval "$(gh copilot alias -- zsh)"
fi

# Disable less history
export LESSHISTFILE=-

# Set aliases
if command -v eza &> /dev/null; then
  HIDDEN=".DS_Store"
  alias ls='eza --icons --ignore-glob="$HIDDEN"'
  alias lsa='eza --icons -a'
  alias lsg='eza --icons --group-directories-first --ignore-glob="$HIDDEN"'
  alias lst='eza --long --classify --all --header --git --no-user --tree --icons --ignore-glob="$HIDDEN" --git --level'
fi
if command -v nvim &> /dev/null; then
  alias vi='nvim'
fi
if command -v trash &> /dev/null; then
  alias rm='trash'
fi
if command -v rg &> /dev/null; then
  alias grep='rg'
fi
