return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    config = {
      pdfviewer = "/System/Applications/Preview.app/Contents/MacOS/Preview",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown", "markdown_inline", "r", "rnoweb" },
      })
    end,
  },
  { "R-nvim/cmp-r" },
}
