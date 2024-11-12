-- Enable loader
vim.loader.enable()

-- Set options
local globals = {
	mapleader = " ",
	maplocalleader = ",",
	loaded_netrw = 1,
	loaded_netrwPlugin = 1,
	showcmdloc = "statusline",
}

for k, v in pairs(globals) do
	vim.g[k] = v
end

local options = {
	relativenumber = false,
	number = true,
	inccommand = "split",
	ignorecase = true,
	laststatus = 3,
	scrolloff = 999,
	updatetime = 300,
	showmode = false,
	splitbelow = true,
	splitright = true,
	undofile = true,
	cursorline = true,
	termguicolors = true,
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	autochdir = true,
	clipboard = "unnamedplus",
	wrap = true,
	grepprg = "rg --vimgrep",
	grepformat = "%f:%l:%c:%m",
	formatexpr = "v:lua.require'conform'.formatexpr()",
	mouse = a,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Bootstrap Mini.nvim
local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"--branch",
		"stable",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

-- Setup Mini.deps
require("mini.deps").setup({ path = { package = path_package } })
require("plugins")
require("keybinds")
require("macros")
