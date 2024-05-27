local icons = require("lazyvim.config").icons

return {
  {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
      opts.sections.lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        {},
      }
      opts.sections.lualine_z = {
        { "filetype", icon_only = true, colored = false, separator = "", padding = { left = 1, right = 0 } },
      }
    end,
  },
}
