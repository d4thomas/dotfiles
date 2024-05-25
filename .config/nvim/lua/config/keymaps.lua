local map = LazyVim.safe_keymap_set

map("n", "<F5>", "<cmd>DiagnosticToggle<cr>", { desc = "Toggle Dianostics", remap = true })
