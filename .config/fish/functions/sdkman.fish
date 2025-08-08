function sdkman --description "Toggle SDKMAN on or off"
    set -l action $argv[1]

    if test -z "$action"
        echo "Usage: sdkman [enable|disable]"
        return 1
    end

    switch $action
        case enable
            if test -f "$HOME/.sdkman/bin/sdkman-init.sh"
                # Save JAVA_HOME and PATH
                set -gx ORIGINAL_JAVA_HOME (/usr/libexec/java_home)
                set -gx ORIGINAL_PATH $PATH
                set -gx SDKMAN_DIR "$HOME/.sdkman"

                # Get updated PATH
                set -l new_path (bash -c "
                    export SDKMAN_DIR='$HOME/.sdkman'
                    source '$HOME/.sdkman/bin/sdkman-init.sh'
                    echo \$PATH
                ")

                # Set PATH
                set -gx PATH (string split ':' $new_path)

                # Capture SDKMAN environment variables
                bash -c "
                    export SDKMAN_DIR='$HOME/.sdkman'
                    source '$HOME/.sdkman/bin/sdkman-init.sh'
                    env | grep -E '^(SDKMAN_|JAVA_HOME=)'
                " | while read -l line
                    set -l parts (string split '=' $line)
                    set -gx $parts[1] $parts[2]
                end

                # Create function that sources SDKMAN
                function sdk --description "SDKMAN command wrapper"
                    bash -c "
                        export SDKMAN_DIR='$HOME/.sdkman'
                        source '$HOME/.sdkman/bin/sdkman-init.sh'
                        sdk $argv
                    "
                end

                echo "SDKMAN enabled"
            else
                echo "SDKMAN not found at $HOME/.sdkman/bin/sdkman-init.sh"
                return 1
            end

        case disable
            # Restore JAVA_HOME and PATH
            if set -q ORIGINAL_JAVA_HOME
                set -gx JAVA_HOME $ORIGINAL_JAVA_HOME
                set -e ORIGINAL_JAVA_HOME
            end

            if set -q ORIGINAL_PATH
                set -gx PATH $ORIGINAL_PATH
                set -e ORIGINAL_PATH
            end

            # Unset SDKMAN environment variables
            set -e SDKMAN_DIR
            set -e SDKMAN_VERSION
            set -e SDKMAN_CANDIDATES_API
            set -e SDKMAN_CURRENT_API
            set -e SDKMAN_PLATFORM
            set -e JAVA_HOME

            # Remove SDK function
            if functions -q sdk
                functions -e sdk
            end

            echo "SDKMAN disabled"

        case '*'
            echo "Invalid action: $action"
            echo "Usage: sdkman [enable|disable]"
            return 1
    end
end
