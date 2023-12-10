return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<Leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files" },
      { "<Leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Find Live grep" }, -- Requires `ripgrep` to be installed.
      { "<Leader>fs", "<CMD>Telescope live_grep<CR>", desc = "Find Live grep" }, -- Requires `ripgrep` to be installed.
      { "<Leader>sg", "<CMD>Telescope live_grep<CR>", desc = "Find Live grep" }, -- Requires `ripgrep` to be installed.
      { "<Leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find Buffers" },
      { "<Leader>ft", "<CMD>Telescope treesitter<CR>", desc = "Find Treesitter symbols" }, -- Requires `treesitter`.
      { "<Leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Find Help tags" },
      { "<Leader>fc", "<CMD>Telescope commands<CR>", desc = "Find Commands" },
      { "<Leader>fm", "<CMD>Telescope marks<CR>", desc = "Find Marks" },
      { "<Leader>fr", "<CMD>Telescope resume<CR>", desc = "Resume last search" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "tsakirist/telescope-lazy.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<Esc>"] = require("telescope.actions").close, -- don't go into normal mode, just close
              ["<C-j>"] = require("telescope.actions").move_selection_next, -- scroll the list with <c-j>
              ["<C-k>"] = require("telescope.actions").move_selection_previous, -- scroll the list with <c-k>
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            ovveride_file_sorter = true,
            case_mode = "smart_case",
          },
          repo = {
            list = {
              file_ignore_patterns = { "/%.cache/", "/%.cargo/", "/share/", "/node_modules/" },
            },
          },
        },
      })
      require("telescope").load_extension("fzf") -- telescope-fzf-native.nvim
      require("telescope").load_extension("lazy") -- telescope-lazy.nvim
    end,
  },
  -- Fuzzy finder for `telescope.nvim`.
  -- Requires `make` installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "make",
  },
  -- Telescope plugins installed by `lazy.nvim`.
  {
    "tsakirist/telescope-lazy.nvim",
    keys = { { "<Leader>fl", "<CMD>Telescope lazy<CR>", desc = "Lazy plugins" } },
    dependencies = {
      "folke/lazy.nvim",
    },
  },
}
