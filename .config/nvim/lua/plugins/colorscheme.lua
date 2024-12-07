return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "italic" },
        operators = {},
      },
    })
    vim.cmd("colorscheme catppuccin")
    local colors = require("catppuccin.palettes").get_palette("mocha")
    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = colors.base })
  end,
}
