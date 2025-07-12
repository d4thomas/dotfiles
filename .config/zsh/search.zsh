# Search
fdf() {
    if [ -z "$1" ]; then
        echo "Usage: fdf <name_pattern>"
        return 1
    fi
    find . -path ./.git -prune -o -print 2>/dev/null | grep -i "$*"
}

fdt() {
    if [ -z "$1" ]; then
        echo "Usage: fdt <search_term>"
        return 1
    fi
    grep -rIH --exclude-dir=".git" "$*" . 2>/dev/null
}