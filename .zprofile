# Load Homebrew
if command -v /opt/homebrew/bin/brew &> /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Setup user specific environment
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:${PATH}"
fi

# Setup Java environment
if [ -d "$(brew --prefix)/opt/openjdk/bin" ]; then
    export PATH="$(brew --prefix)/opt/openjdk/bin:${PATH}"
fi

# Setup .NET environment
if [ -d "$HOME/.dotnet/tools" ]; then
    export PATH="$HOME/.dotnet/tools:${PATH}"
fi

# Setup JetBrains Toolbox
if [ -d "$HOME//Library/Application Support/JetBrains/Toolbox/scripts" ]; then
    export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fi

# Setup Coursier
if command -v coursier &> /dev/null; then
    export COURSIER_BIN_DIR="$HOME/.local/bin"
fi
