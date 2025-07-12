# Load Zsh configuration
if [[ -d "$HOME/.zsh" ]]; then
    ZDOT="$HOME/.zsh"

    # Source Homebrew configuration
    [[ -f "$ZDOT/homebrew.zsh" ]] && source "$ZDOT/homebrew.zsh"

    # Source all other configuration files
    for file in "$ZDOT"/*.zsh; do
        case "$file" in
            "$ZDOT/homebrew.zsh") continue ;;
            *) source "$file" ;;
        esac
    done
fi
