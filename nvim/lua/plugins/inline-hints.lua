return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require("tiny-inline-diagnostic").setup()
    -- keymap to toggle inline hints
    vim.keymap.set("n", "<leader>ui", require("tiny-inline-diagnostic").toggle, { desc = "Toggle inline hints" })
  end,
}
