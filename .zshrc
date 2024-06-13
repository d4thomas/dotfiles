# Attach/create tmux sessions if shell opened in WezTerm
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
  alias brew-restore='brew bundle --file=~/.config/brew/Brewfile'
fi

# Configure Zsh autocompletion
if [ -d "$(brew --prefix)/share/zsh-completions" ]; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
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

  # Configure colors
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
    --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
fi

# Configure CoPilot CLI
if command -v gh &> /dev/null; then
  eval "$(gh copilot alias -- zsh)"
fi

########################
### Custom Aliases   ###
########################

if command -v eza &> /dev/null; then
  alias ls='eza --icons --ignore-glob=".DS_Store|NOSYNC.tmp|go"'
  alias lst='eza --long --classify --all --header --git --no-user --tree --icons --git --level'
fi
if command -v nvim &> /dev/null; then
  alias vi='nvim'
fi
if command -v trash &> /dev/null; then
  alias rm='trash'
fi
if command -v bat &> /dev/null; then
  alias cat='bat -p'
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
