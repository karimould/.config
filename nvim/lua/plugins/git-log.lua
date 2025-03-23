return {
  "rbong/vim-flog",
  lazy = true,
  keys = {
    { "<leader>gl", "<cmd>Flog<cr>", desc = "Git log" },
  },
  cmd = { "Flog", "Flogsplit", "Floggit" },
  dependencies = {
    "tpope/vim-fugitive",
  },
}
