function _bang
    set -l token (commandline -t)
    if test "$token" = "!"
        commandline -t $history[1]
    else
        commandline -i !
    end
end
