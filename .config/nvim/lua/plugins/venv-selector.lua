vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select virtual environment", remap = true })

return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python" },
    lazy = false,
    branch = "regexp",
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
