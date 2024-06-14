# Load Homebrew
if command -v /opt/homebrew/bin/brew &> /dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Setup user specific environment
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:${PATH}"
fi

# Setup Ruby environment
if [ -d "$(brew --prefix)/opt/ruby/bin" ]; then
  # Ruby path
  export PATH="$(brew --prefix)/opt/ruby/bin:${PATH}"

  # Ruby gems path
  export PATH="$(ruby -r rubygems -e 'puts Gem.dir')/bin:${PATH}"
  export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:${PATH}"

  # Environment manager
  if command -d rbenv &> /dev/null; then
    eval "$(rbenv init - zsh)"
  fi
fi

# Setup Java environment
if [ -d "$(brew --prefix)/opt/openjdk/bin" ]; then
  export PATH="$(brew --prefix)/opt/openjdk/bin:${PATH}"
fi
