ENVDIR="$ZDOTDIR/env/"

# Load Zsh profile
if [[ -d "$ENVDIR" ]]; then
    ENVDIR_FILES=("$ENVDIR"/*.zsh(N))
    if command -v brew &> /dev/null; then
        BREW_PREFIX="$(brew --prefix)"
    fi

    if (( ${#ENVDIR_FILES[@]} )); then
        # Configure Homebrew first
        [[ -f "$ENVDIR/homebrew.zsh" ]] && source "$ENVDIR/homebrew.zsh"

        for file in "${ENVDIR_FILES[@]}"; do
            [[ "$file" == "$ENVDIR/homebrew.zsh" ]] && continue
            source "$file"
        done
    fi

    unset ENVDIR_FILES
    unset BREW_PREFIX
fi

unset ENVDIR