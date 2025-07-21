# Basic completion
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*:messages' format '%F{red}%d%f'
zstyle ':completion:*:warnings' format '%F{red}no matches found%f'
zstyle ':completion:*:corrections' format '%F{green}%d (errors: %e)%f'

# Directory completion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true

# History-based completion
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Bind Alt-b/f for interactive search prompts s 
bindkey '^[b' history-incremental-search-backward
bindkey '^[f' history-incremental-search-forward

# Bind up/down for prefix-based search
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# Configure completion
setopt GLOB_COMPLETE
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt COMPLETE_ALIASES