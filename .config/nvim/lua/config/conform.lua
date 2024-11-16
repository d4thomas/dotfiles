local ok, conform = pcall(require, "conform")
if not ok then
	return print("Conform failed to load!")
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		python = { "black" },
		java = { "clang-format" },
	},
})
