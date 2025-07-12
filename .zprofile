ZDOT="$HOME/.config/zsh/zprofile"

# Load Zsh profile
if [[ -d "$ZDOT" ]]; then
    zsh_files=("$ZDOT"/*.zsh(N))
    
    if (( ${#zsh_files[@]} )); then
        # Configure Homebrew first
        [[ -f "$ZDOT/homebrew.zsh" ]] && source "$ZDOT/homebrew.zsh"
  
        for file in "${zsh_files[@]}"; do
            [[ "$file" == "$ZDOT/homebrew.zsh" ]] && continue
            source "$file"
        done
    fi
fi