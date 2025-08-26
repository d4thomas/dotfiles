function _dollar
    set -l token (commandline -t)
    if test "$token" = "!"
        commandline -t (echo $history[1] | string split ' ')[-1]
    else
        commandline -i '$'
    end
end

