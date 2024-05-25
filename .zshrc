# Configure Homebrew
if command -v brew &> /dev/null; then
  # Add autocomletions
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  # Sent enviornment variables
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_NO_EMOJI=1

  # Add aliases for backup/restore
  alias brew_backup='brew list > ~/.config/brew_packages'
  alias brew_restore='xargs brew install < ~/.config/brew_packages'
fi

# Enable autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true

# Add Mason tools to PATH
if [ -d "$HOME/.local/share/nvim/mason/bin" ]; then
  export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
fi

# User specific environment
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Load Starship prompt if installed
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Load CoPilot CLI aliases if installed
if command -v gh &> /dev/null; then
  eval "$(gh copilot alias -- zsh)"
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
