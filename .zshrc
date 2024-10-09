########################
### Color Config     ###
########################

BLACK="#000000"
RED="#f78166"
GREEN="#56d364"
YELLOW="#e3b341"
BLUE="#6ca4f8"
MAGENTA="#db61a2"
CYAN="#2b7489"
WHITE="#ffffff"

BRIGHTBLACK="#4d4d4d"
BRIGHTRED="#f78166"
BRIGHTGREEN="#56d364"
BRIGHTYELLOW="#e3b341"
BRIGHTBLUE="#6ca4f8"
BRIGHTMAGENTA="#db61a2"
BRIGHTCYAN="#2b7489"
BRIGHTWHITE="#ffffff"

BACKGROUND="#101216"
FOREGROUND="#8b949e"

CURSOR="#c9d1d9"

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
    --color=fg:-1,bg:-1,hl:$YELLOW
    --color=fg+:,bg+:,hl+:$RED
    --color=info:$MAGENTA,prompt:$GREEN,pointer:$BLUE
    --color=marker:$RED,spinner:$CYAN,header:-1"
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
