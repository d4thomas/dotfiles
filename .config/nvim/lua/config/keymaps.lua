local map = LazyVim.safe_keymap_set

map("n", "<F1>", "<cmd>Telescope keymaps<cr>", { desc = "Search Keymaps", remap = true })
map("n", "<F5>", "<cmd>DiagnosticToggle<cr>", { desc = "Toggle Dianostics", remap = true })
map("n", "<C-]>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
