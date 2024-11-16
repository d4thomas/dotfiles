---@diagnostic disable-next-line: unused-local
local augroup = vim.api.nvim_create_augroup
---@diagnostic disable-next-line: unused-local
local autocmd = vim.api.nvim_create_autocmd

-- Commands
vim.api.nvim_create_user_command("Files", function()
	MiniFiles.open()
end, {})
