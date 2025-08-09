eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive    
    # Fish
    set fish_greeting
    set -g fish_complete_case_insensitive true

    # Dotfiles
    alias dfs 'env GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git'

    # Basic
    alias less 'less -R'
    alias rm 'trash'

    # Eza
    set -g HIDDEN ".DS_Store|IdeaSnapshots"
    alias ls 'eza --no-quotes --ignore-glob="$HIDDEN"'
    alias lsa 'eza -a'
    alias lsm 'eza -s modified'
    alias lsi 'eza --ignore-glob'
    alias lsg "eza --no-quotes --group-directories-first --ignore-glob='$HIDDEN'"
    alias lst "eza --no-quotes --long --classify --all --header --git --no-user --tree --ignore-glob='$HIDDEN' --git --level"

    # Homebrew
    set -gx HOMEBREW_CASK_OPTS '--no-quarantine'
    set -gx HOMEBREW_NO_ENV_HINTS 1
    set -gx HOMEBREW_NO_EMOJI 1
    alias bbd 'brew bundle dump --file=~/.config/brew/Brewfile --force'
    alias bbr 'brew bundle --file=~/.config/brew/Brewfile --force'

    # Find
    alias fdf 'find . -path ./.git -prune -o -print 2>/dev/null | grep -i'
    alias fdt 'grep -rIH --color=always --exclude-dir=".git"'

    # Man
    alias man 'env \
        LESS_TERMCAP_mb=\e\[31m \
        LESS_TERMCAP_md=\e\[34m \
        LESS_TERMCAP_me=\e\[0m \
        LESS_TERMCAP_se=\e\[0m \
        LESS_TERMCAP_so=\e\[43\;30m \
        LESS_TERMCAP_ue=\e\[0m \
        LESS_TERMCAP_us=\e\[36m \
        man'

    # Starship
    starship init fish | source

    # Colors
    set fish_color_normal brblack
    set fish_color_valid_path blue --no-underline
    set fish_color_search_match magenta --underline
    set fish_color_selection --background=brblack
    set fish_pager_color_progress brblack
    set fish_pager_color_prefix brblack
    set fish_pager_color_completion brblack
    set fish_pager_color_description brblack
end

# Paths
set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/.dotnet/tools" $PATH
set -gx PATH (brew --prefix)/opt/openjdk/bin $PATH
set -gx PATH "$HOME/Library/Application Support/JetBrains/Toolbox/scripts" $PATH
set -gx COURSIER_BIN_DIR "$HOME/.local/bin"
set -gx LESSHISTFILE -
