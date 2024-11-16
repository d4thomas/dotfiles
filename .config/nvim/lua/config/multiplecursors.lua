local ok, multiplecursors = pcall(require, "multiple-cursors")
if not ok then
	return print("Multiple-Cursors failed to load!")
end

multiplecursors.setup({})
