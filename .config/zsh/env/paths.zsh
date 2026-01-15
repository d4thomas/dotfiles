# Paths
function validPath() {
    if [[ -d "$1" ]]; then
        export PATH="$1:$PATH"
    fi
}

validPath "$HOME/.local/bin"
validPath "$BREW_PREFIX/opt/openjdk/bin"