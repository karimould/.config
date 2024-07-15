return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sr",
      "<cmd>GrugFar<CR>",
      desc = "Find and Replace",
    },
    {
      "<leader>sw",
      function()
        require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "grug-far - search current word",
    },
    {
      "<leader>sf",
      function()
        require("grug-far").grug_far({ prefills = { flags = vim.fn.expand("%") } })
      end,
      desc = "grug-far - search in current file",
    },
  },
  config = function()
    require("grug-far").setup({})
  end,
}
