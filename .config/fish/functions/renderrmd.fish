# Quickly render Rmd files to html
function renderrmd
    if test -z "$argv[1]"
        echo "Usage: renderrmd <file>"
        return 1
    end
    Rscript -e "rmarkdown::render('$argv[1]')"
end
