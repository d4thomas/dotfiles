# Configure Homebrew
if command -v brew &> /dev/null; then
  # Add autocomletions
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  # Sent enviornment variables
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_NO_EMOJI=1

  # Add aliases for backup/restore
  alias brew_backup='brew bundle dump --file=~/.config/brew/Brewfile --force'
  alias brew_restore='brew bundle --file=~/.config/brew/Brewfile'
fi

# Enable autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true

# User specific environment
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Ruby environment
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:/opt/homebrew/opt/ruby/bin:$PATH"
fi

if [ -d "/opt/homebrew/opt/openjdk/bin" ]; then
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

# Load Starship prompt if installed
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Load CoPilot CLI aliases if installed
if command -v gh &> /dev/null; then
  eval "$(gh copilot alias -- zsh)"
fi

# Configure fzf
if command -v fzf &> /dev/null; then
  # CTRL-t (fzf), CTRL-r (shell), Option-c (cd ...)
   eval "$(fzf --zsh)"

  # Set theme
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --color=fg:#c0caf5,bg:#24283b,hl:#ff9e64 \
    --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
    --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
    --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
fi

# Set aliases if specific programs installed
if command -v eza &> /dev/null; then
  alias ls='eza --icons --ignore-glob=".DS_Store|NOSYNC.tmp|go|"'
fi
if command -v nvim &> /dev/null; then
  alias vi='nvim'
fi
if command -v trash &> /dev/null; then
  alias rm='trash'
fi
