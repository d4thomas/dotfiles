local ok, colorscheme = pcall(require, "ayu")
if not ok then
  return print("Colorscheme failed to load!")
end

colorscheme.setup({})

vim.cmd("colorscheme ayu")

-- Fix colors
local colors = require("ayu.colors")
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = colors.comment })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.guide_active })
