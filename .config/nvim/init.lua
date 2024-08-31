require("config.lazy")

vim.api.nvim_set_hl(0, "BufferlineFill", { bg = "#2d2a2e" })

vim.diagnostic.config({
  virtual_text = false,
})
