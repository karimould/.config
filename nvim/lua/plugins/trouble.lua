return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = { { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open Diagnostics for current buffer" } },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
