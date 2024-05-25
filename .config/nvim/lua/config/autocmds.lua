vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  config({
    virtual_text = not config().virtual_text,
  })
end, { desc = "Toggle Diagnostic" })
