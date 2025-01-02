return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require("tiny-inline-diagnostic").setup()
    -- keymap to toggle inline hints
    vim.keymap.set(
      "n",
      "<leader>ui",
      -- toggle inlay hints
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        print("Inlay hints enabled: " .. vim.lsp.inlay_hint.is_enabled())
      end,
      { desc = "Toggle inline hints" }
    )
  end,
}
