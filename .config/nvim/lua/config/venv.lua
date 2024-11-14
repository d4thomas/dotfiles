local ok, venv = pcall(require, "venv-selector")
if not ok then
	return print("Venv selector failed to load!")
end

venv.setup({
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
