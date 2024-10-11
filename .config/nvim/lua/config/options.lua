-- Enable line numbers
vim.o.number = true

-- Create an autocmd group for toggling line numbers
vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Enable relative line numbers based on mode and focus
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = "numbertoggle",
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})

-- Disable relative line numbers based on mode and focus
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = "numbertoggle",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})
