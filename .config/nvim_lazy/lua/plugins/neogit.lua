vim.keymap.set("n", "<F3>", "<cmd>Neogit<cr>", { desc = "Toggle Neogit", remap = true })

return {
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
    config = true,
  },
}
