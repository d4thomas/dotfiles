# Load Homebrew
if command -v /opt/homebrew/bin/brew &> /dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Setup tmux environment
if [[ $TERM_PROGRAM = WezTerm ]]; then
   if command -v tmux &> /dev/null; then
      if ! tmux attach -d > /dev/null 2>&1; then
        tmux new
      fi
   fi
fi
