-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")
map({ "n", "v", "i" }, "<M-Down>", "<cmd>MultipleCursorsAddDown<CR>")
map({ "n", "v", "i" }, "<M-Up>", "<cmd>MultipleCursorsAddUp<CR>")
map("n", "bd", "<cmd>bdel<CR>", { desc = "Delete Current Buffer" })
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<F1>", "<cmd>Telescope keymaps<cr>", { desc = "Search Keymaps", remap = true })
