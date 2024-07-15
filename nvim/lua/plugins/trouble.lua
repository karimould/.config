return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
  opts = {
    focus = true,
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
