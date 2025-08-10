# SDK Manager
if [ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    sdkman() {
        local sdkman_init="$HOME/.sdkman/bin/sdkman-init.sh"

        if [[ "$1" == "enable" ]]; then
            export ORIGINAL_JAVA_HOME=$(/usr/libexec/java_home)
            export SDKMAN_DIR="$HOME/.sdkman"
            [[ -s "$sdkman_init" ]] && source "$sdkman_init"
            echo "SDKMAN enabled"
        elif [[ "$1" == "disable" ]]; then
            if [[ -n "$ORIGINAL_JAVA_HOME" ]]; then
                export JAVA_HOME="$ORIGINAL_JAVA_HOME"
                unset ORIGINAL_JAVA_HOME
                hash -r
            fi
            unset SDKMAN_DIR
            unset SDKMAN_VERSION
            unset SDKMAN_CANDIDATES_API
            unset SDKMAN_CURRENT_API
            unset SDKMAN_PLATFORM
            echo "SDKMAN disabled"
        else
            echo "Usage: sdkman [enable|disable]"
            return 1
        fi
    }
fi