# Paths
function validPath() {
    if [[ -d "$1" ]]; then
        export PATH="$1:$PATH"
    fi
}

validPath "$HOME/.local/bin"
validPath "$HOME/.dotnet/tools"
validPath "$(brew --prefix)/opt/openjdk/bin"

# Coursier
if command -v coursier >/dev/null 2>&1; then
    export COURSIER_BIN_DIR="$HOME/.local/bin"
fi