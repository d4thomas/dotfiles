return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python" },
    lazy = false,
    config = function()
      require("venv-selector").setup({
        settings = {
          search = {
            my_venvs = {
              enable_cached_venvs = false,
              enable_default_searches = false,
              command = "fd python$ ./venv",
              "fd python$ ./.venv",
            },
          },
        },
      })
    end,
  },
}
