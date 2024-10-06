########################
### Color Config     ###
########################

COLOR_01="#6a787a"    # Black
COLOR_02="#e9653b"    # Red
COLOR_03="#39e9a8"    # Green
COLOR_04="#e5b684"    # Yellow
COLOR_05="#44aae6"    # Blue
COLOR_06="#e17599"    # Magenta
COLOR_07="#3dd5e7"    # Cyan
COLOR_08="#c3dde1"    # White

COLOR_09="#598489"    # Bright Black
COLOR_10="#e65029"    # Bright Red
COLOR_11="#00ff9a"    # Bright Green
COLOR_12="#e89440"    # Bright Yellow
COLOR_13="#009afb"    # Bright Blue
COLOR_14="#ff578f"    # Bright Magenta
COLOR_15="#5fffff"    # Bright Cyan
COLOR_16="#d9fbff"    # Bright White

BACKGROUND="#1e1e1e"  # Background
FOREGROUND="#cccccc"  # Foreground

CURSOR="#cccccc"      # Cursor

########################
### Program Config   ###
########################

# Setup tmux environment
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

  # Add aliases for backup/restore
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

  # Configure fzf theme
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
    --pointer=""
    --color=fg:-1,bg:-1,hl:$COLOR_04
    --color=fg+:,bg+:,hl+:$COLOR_02
    --color=info:$COLOR_06,prompt:$COLOR_03,pointer:$COLOR_05
    --color=marker:$COLOR_02,spinner:$COLOR_07,header:-1"
fi

# Configure CoPilot CLI
if command -v gh &> /dev/null; then
  eval "$(gh copilot alias -- zsh)"
fi

########################
### Custom Aliases   ###
########################

if command -v eza &> /dev/null; then
  HIDDEN=".DS_Store|go"
  alias lsh='eza --icons'
  alias ls='eza --icons --ignore-glob="$HIDDEN"'
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

########################
### Custom Functions ###
########################

# Render Rmd files to html
renderrmd() {
  if [ -z "$1" ]; then
    echo "Usage: renderrmd <file>"
    return 1
  fi
  Rscript -e "rmarkdown::render('$1')"
}
