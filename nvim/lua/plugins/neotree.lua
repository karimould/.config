return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { "<leader>et", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  opts = {
    -- fill any relevant options here
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = true,
      filtered_items = {
        visible = true,
      },
    },
    window = {
      position = "right",
      mappings = {
        ["<space>"] = "none",
      },
    },
  },
}
