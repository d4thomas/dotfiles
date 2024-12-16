return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = {
        preset = "super-tab",
      }
      opts.sources = {
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
          },
        },
        compat = {},
        -- Not enabled: snippets, copilot
        default = { "lsp", "path", "buffer" },
        cmdline = {},
      }
    end,
  },
}
