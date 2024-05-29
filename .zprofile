# Load Homebrew
if command -v /opt/homebrew/bin/brew &> /dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Function to render Rmd files to html
render_rmarkdown() {
  if [ -z "$1" ]; then
    echo "Usage: render_rmarkdown <file>"
    return 1
  fi
  Rscript -e "rmarkdown::render('$1')"
}
