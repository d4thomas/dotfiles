# Configure prompt
if [ -f "$(brew --prefix)/share/zsh/site-functions/prompt_pure_setup" ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=12

    PURE_GIT_UP_ARROW="▲"
    PURE_GIT_DOWN_ARROW="▼"
    PURE_GIT_STASH_SYMBOL="☰"

    zstyle :prompt:pure:git:stash show yes
    zstyle :prompt:pure:git:dirty color magenta
    zstyle :prompt:pure:prompt:success color green
    zstyle :prompt:pure:prompt:continuation color green

    autoload -U promptinit; promptinit
    prompt pure
elif command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
else
    autoload -U colors && colors
    local success="%{$fg[green]%}❯%{$reset_color%}"
    local error="%{$fg[red]%}❯%{$reset_color%}"

    build_prompt() {
        local newline=$'\n'
        local dir="%{$fg[blue]%}%~%{$reset_color%}"
        PROMPT="${dir}${newline}${1} "
    }

    precmd() {
    if [[ $? -eq 0 ]]; then
        build_prompt "${success}"
    else
        build_prompt "${error}"
    fi
    }

    build_prompt "${success}"
fi