# Autosuggestions
if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# History substring search
if [ -f "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# Syntax highlighting
if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    (( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
        ZSH_HIGHLIGHT_STYLES[path]=none
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=none
        ZSH_HIGHLIGHT_STYLES[path_prefix]=none
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=none
        ZSH_HIGHLIGHT_STYLES[precommand]=none
fi