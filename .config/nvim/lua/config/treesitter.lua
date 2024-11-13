local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	return print("Treesitterl failed to load!")
end

---@diagnostic disable-next-line: missing-fields
treesitter.setup({
	ensure_installed = { "lua", "vim", "vimdoc" },
	auto_install = true,
	highlight = {
		enable = true,
		---@diagnostic disable-next-line: unused-local
		disable = function(lang, buf)
			local max_filesize = 100 * 1024
			---@diagnostic disable-next-line: undefined-global
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
})
