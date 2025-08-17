# Configure aiases
alias grep="grep --color=always"
alias less="less -R"
alias kbloop="pgrep -f bloop | xargs -r kill -9"
alias man="env LESS_TERMCAP_mb=$'\e[31m' \
               LESS_TERMCAP_md=$'\e[34m' \
               LESS_TERMCAP_me=$'\e[0m' \
               LESS_TERMCAP_se=$'\e[0m' \
               LESS_TERMCAP_so=$'\e[43;30m' \
               LESS_TERMCAP_ue=$'\e[0m' \
               LESS_TERMCAP_us=$'\e[36m' man"

if command -v eza &> /dev/null; then
    HIDDEN=".DS_Store"
    alias ls="eza --no-quotes --ignore-glob='$HIDDEN'"
    alias lsa="eza -a"
    alias lss="eza -s modified"
    alias lsi="noglob _lsi_func"
    alias lsg="eza --no-quotes --group-directories-first --ignore-glob='$HIDDEN'"
    alias lst="eza --no-quotes --long --classify --all --header --git --no-user --tree --ignore-glob='$HIDDEN' --git --level"

    _lsi_func() {
        eza --ignore-glob="$*"
}
else
    alias ls="ls --color=always"
fi

# VS Code
if command -v code &> /dev/null; then
    alias code="open -b com.microsoft.VSCode"
fi

if command -v $(brew --prefix)/opt/trash/bin/trash &> /dev/null; then
    alias trash="$(brew --prefix)/opt/trash/bin/trash"
    alias rm="trash"
fi
