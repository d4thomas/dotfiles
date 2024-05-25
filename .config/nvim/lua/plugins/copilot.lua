vim.keymap.set("n", "<F2>", "<cmd>Copilot toggle<cr>", { desc = "Toggle CoPilot", remap = true })
vim.keymap.set("n", "<F12>", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle CoPilot Chat", remap = true })

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
          auto_refresh = false,
        },
        suggestion = {
          enabled = false,
          auto_trigger = true,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
    opts = {
      debug = false,
      window = { layout = "float" },
    },
  },
}
