function sdkman --description "Toggle SDKMAN on or off"
    set -l action $argv[1]

    if test -z "$action"
        echo "Usage: sdkman [enable|disable]"
        return 1
    end

    switch $action
        case enable
            if test -s "$HOME/.sdkman/bin/sdkman-init.sh"
                # Export SDKMAN environment variables
                set -gx SDKMAN_DIR "$HOME/.sdkman"
                set -gx SDKMAN_VERSION (cat "$SDKMAN_DIR/var/version" 2>/dev/null; or echo "unknown")
                set -gx SDKMAN_PLATFORM (cat "$SDKMAN_DIR/var/platform" 2>/dev/null; or echo "unknown")

                # Add SDKMAN candidates to PATH
                for candidate_dir in $SDKMAN_DIR/candidates/*/current/bin
                    if test -d $candidate_dir
                        set -gx PATH $candidate_dir $PATH
                    end
                end

                # Create sdk function wrapper
                function sdk --description "SDKMAN wrapper for fish shell"
                    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
                end

                echo "SDKMAN enabled"
            else
                echo "SDKMAN not found at $HOME/.sdkman/bin/sdkman-init.sh"
                return 1
            end

        case disable
            # Remove SDKMAN from PATH
            if set -q SDKMAN_DIR
                set -e SDKMAN_DIR
            end
            if set -q SDKMAN_PLATFORM
                set -e SDKMAN_PLATFORM
            end
            if set -q SDKMAN_VERSION
                set -e SDKMAN_VERSION
            end

            # Remove SDKMAN paths from PATH
            set -l new_path
            for path_entry in $PATH
                if not string match -q "*/.sdkman/*" $path_entry
                    set new_path $new_path $path_entry
                end
            end
            set -gx PATH $new_path

            # Remove sdk function if it exists
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
