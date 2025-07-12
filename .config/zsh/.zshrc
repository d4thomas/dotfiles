RCDIR="$ZDOTDIR/rc/"

# Load Zsh configuration
if [[ -d "$RCDIR" ]]; then
    RCDIR_FILES=("$RCDIR"/*.zsh(N))
    
    if (( ${#RCDIR_FILES[@]} )); then
        # Configure Homebrew first
        [[ -f "$RCDIR/homebrew.zsh" ]] && source "$RCDIR/homebrew.zsh"
  
        for file in "${RCDIR_FILES[@]}"; do
            [[ "$file" == "$RCDIR/homebrew.zsh" ]] && continue
            source "$file"
        done
    fi
fi