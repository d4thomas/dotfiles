# Dotfiles
if command -v git &> /dev/null; then
    alias dfs="env GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git"
fi

# Grep
alias grep="grep --color=always"

# Less
alias less="less -R"

# Gemini
alias gemini="npx @google/gemini-cli"

# Rclone
if command -v rclone &> /dev/null; then
    alias rcopy="rclone copy --transfers 8 --fast-list -P"
fi

# VS Code
if command -v code &> /dev/null; then
    alias code="open -b com.microsoft.VSCode"
    alias kbloop="pgrep -f bloop | xargs -r kill -9"
fi

# Trash
if [[ -f "$BREW_PREFIX/opt/trash/bin/trash" ]]; then
    alias trash="$BREW_PREFIX/opt/trash/bin/trash"
    alias rm="trash"
fi

# Eza
if command -v eza &> /dev/null; then
    HIDDEN=".DS_Store"
    alias ls="eza --no-quotes --ignore-glob='$HIDDEN'"
    alias lsa="eza -a"
    alias lss="eza -s modified"
    alias lsi="eza --ignore-glob"
    alias lsg="eza --no-quotes --group-directories-first --ignore-glob='$HIDDEN'"
    alias lst="eza --no-quotes --long --classify --all --header --git --no-user --tree --ignore-glob='$HIDDEN' --git --level"
    unset HIDDEN
fi

# Find
alias fdf="find . -path ./.git -prune -o -path './Library/Mobile Documents' -prune -o -print 2>/dev/null | grep -i"
alias fdt="grep -rIH --color=always --exclude-dir=.git --exclude-dir='Library/Mobile Documents'"

# Man
alias man="env \
    LESS_TERMCAP_mb=$'\e[31m' \
    LESS_TERMCAP_md=$'\e[34m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[43;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[36m' man"
