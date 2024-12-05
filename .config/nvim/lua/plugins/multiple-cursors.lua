return {
  "brenton-leighton/multiple-cursors.nvim",
  config = true,
  keys = {
    { "<M-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i" } },
    { "<M-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i" } },
  },
}
