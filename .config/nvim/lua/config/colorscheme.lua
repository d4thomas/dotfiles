local ok, colorscheme = pcall(require, "ayu")
if not ok then
	return print("Colorscheme failed to load!")
end

local colors = require("ayu.colors")

colorscheme.setup({
    overrides = function()
    return {
      Statement = { fg = colors.keyword, italic = true },
    }
  end
})

vim.cmd("colorscheme ayu")

-- Fix colors
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = colors.comment })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.guide_active })
vim.api.nvim_set_hl(0, "MiniTablineFill", { bg = colors.bg })
