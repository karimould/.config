return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- change a keymap
      -- add a keymap to browse plugin files
      {
        "<leader>fs",
        function()
          require("telescope.builtin").live_grep({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find String",
      },
    },
    -- change some options
    opts = {
      --   defaults = {
      --     layout_strategy = "horizontal",
      --     layout_config = { prompt_position = "top" },
      --     sorting_strategy = "ascending",
      --     winblend = 0,
      --   },
      -- add some mappings
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
          },
        },
      },
    },
  },
  -- add telescope-fzf-native
  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --     config = function()
  --       require("telescope").load_extension("fzf")
  --     end,
  --   },
  -- },
}
