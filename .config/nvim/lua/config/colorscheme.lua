local ok, colorscheme = pcall(require, "catppuccin")
if not ok then
	return print("Colorscheme failed to load!")
end

colorscheme.setup({
	flavour = "mocha",
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		functions = { "italic" },
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = { "italic" },
		operators = {},
	},
})

-- Load color scheme
vim.cmd("colorscheme catppuccin")

-- Set custom colors
local colors = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "LineNr", { fg = colors.surface1 })
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = colors.overlay0 })
vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = colors.text, bg = colors.base })
vim.api.nvim_set_hl(0, "MiniTablineVisible", { fg = colors.text, bg = colors.base })
vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = colors.overlay1, bg = colors.base })
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = colors.text, bg = colors.base, italic = true })
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { fg = colors.text, bg = colors.base, italic = true })
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { fg = colors.overlay1, bg = colors.base, italic = true })
vim.api.nvim_set_hl(0, "MiniTablineFill", { bg = colors.base })
