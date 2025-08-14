eval (/opt/homebrew/bin/brew shellenv)

if status is-interactive
    # Dotfiles
    alias dfs "env GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git"

    # Less
    alias less "less -R"

    # VS Code
    alias code "open -b com.microsoft.VSCode $argv"

    # Trash
    if test -f (brew --prefix)/opt/trash/bin/trash
        alias trash (brew --prefix)/opt/trash/bin/trash
        alias rm "trash"
    end

    # Eza
    if type -q eza
        set HIDDEN ".DS_Store"
        alias ls "eza --no-quotes --ignore-glob='$HIDDEN'"
        alias lsa "eza -a"
        alias lss "eza -s modified"
        alias lsi "eza --ignore-glob"
        alias lsg "eza --no-quotes --group-directories-first --ignore-glob='$HIDDEN'"
        alias lst "eza --no-quotes --long --classify --all --header --git --no-user --tree --ignore-glob='$HIDDEN' --git --level"
        set -e HIDDEN
    end

    # Homebrew
    set -gx HOMEBREW_CASK_OPTS "--no-quarantine"
    set -gx HOMEBREW_NO_ENV_HINTS 1
    set -gx HOMEBREW_NO_EMOJI 1
    alias bbd "brew bundle dump --file=~/.config/brew/Brewfile --force"
    alias bbb "brew update; brew upgrade; brew cleanup --prune=all; bbd"
    alias bbr "brew bundle --file=~/.config/brew/Brewfile --force"

    # Find
    alias fdf "find . -path ./.git -prune -o -print 2>/dev/null | grep -i"
    alias fdt "grep -rIH --color=always --exclude-dir=".git""

    # Man
    alias man "env \
        LESS_TERMCAP_mb=\e\[31m \
        LESS_TERMCAP_md=\e\[34m \
        LESS_TERMCAP_me=\e\[0m \
        LESS_TERMCAP_se=\e\[0m \
        LESS_TERMCAP_so=\e\[43\;30m \
        LESS_TERMCAP_ue=\e\[0m \
        LESS_TERMCAP_us=\e\[36m \
        man"

    # Starship
    if type -q starship
        starship init fish | source
    end

    # Fish
    set fish_greeting
    set -g fish_complete_case_insensitive true
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
function validPath
    if test -d $argv[1]
        set -gx PATH $argv[1] $PATH
    end
end

validPath $HOME/.local/bin
validPath $HOME/.dotnet/tools
validPath (brew --prefix)/opt/openjdk/bin

# Coursier
if type -q coursier
    set -gx COURSIER_BIN_DIR $HOME/.local/bin
end

# Less
set -gx LESSHISTFILE -