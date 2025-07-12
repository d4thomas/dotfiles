ZDOT="$HOME/.config/zsh/zprofile"
 
# Load Zsh profile
if [[ -d "$ZDOT" ]]; then
    ZDOT_FILES=("$ZDOT"/*.zsh(N))
    
    if (( ${#ZDOT_FILES[@]} )); then
        # Configure Homebrew first
        [[ -f "$ZDOT/homebrew.zsh" ]] && source "$ZDOT/homebrew.zsh"
  
        for file in "${ZDOT_FILES[@]}"; do
            [[ "$file" == "$ZDOT/homebrew.zsh" ]] && continue
            source "$file"
        done
    fi
fi
