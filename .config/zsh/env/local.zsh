# Configure user specific environment
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:${PATH}"
fi