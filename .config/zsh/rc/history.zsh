# Configure Zsh history parameters
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# Disable less histroy
export LESSHISTFILE=-

# Toggle saving history file
togglehist() {
    if [[ -n "$HISTFILE" ]]; then
        export _OLD_HISTFILE="$HISTFILE"
        unset HISTFILE
        echo "History Disabled"
    else
        export HISTFILE="${_OLD_HISTFILE}"
        echo "History Enabled"
    fi
}
