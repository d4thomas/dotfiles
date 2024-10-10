return {
  "Shatur/neovim-ayu",
  name = "ayu",
  lazy = false,
  priority = 1000,
  config = function()
    require("ayu").setup({})
    vim.cmd("colorscheme ayu")
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#636A72" })
    -- vim.api.nvim_set_hl(0, "@operator.python", { fg = "#ca5857" })
  end,
}
