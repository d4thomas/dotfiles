return {
  {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
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
    end,
  },
}
