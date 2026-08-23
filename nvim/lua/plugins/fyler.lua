return {
  "A7Lavinraj/fyler.nvim",
  dependencies = { "nvim-mini/mini.icons" },

  config = function(_, opts)
    local fyler = require("fyler")

    -- Apply plugin opts if needed
    fyler.setup(opts)

    -- Keymap
    vim.keymap.set({ "n", "x" }, "<leader>ee", function()
      fyler.toggle({
        kind = "split_right_most",
      })
    end, { desc = "Toggle Fyler File Explorer" })
  end,

  opts = {}, -- plugin options (empty is fine)
}

