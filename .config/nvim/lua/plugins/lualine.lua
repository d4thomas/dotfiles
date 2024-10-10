local icons = require("lazyvim.config").icons

return {
  {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
      opts.sections.lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      }
      opts.sections.lualine_z = {
        {
          function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.bo[buf].modified then
                return "󱙃"
              end
            end
            return "󱣪"
          end,
        },
      }

      opts.options = {
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      }
    end,
  },
}
