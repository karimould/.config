return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      CustomOilBar = function()
        local path = vim.fn.expand("%")
        path = path:gsub("oil://", "")

        return "  " .. vim.fn.fnamemodify(path, ":.")
      end

      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        win_options = {
          winbar = "%{v:lua.CustomOilBar()}",
        },
        delete_to_trash = false,
        view_options = {
          show_hidden = true,
          preview_split = "right",
        },
        preview_win = {
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
          -- How to open the preview window "load"|"scratch"|"fast_scratch"
          preview_method = "fast_scratch",
          -- Window-local options to use for preview window buffers
          win_options = {},
        },
      })
      vim.keymap.set("n", "<space>ee", require("oil").toggle_float, { desc = "Open parent directory" })
    end,
  },
} -- return {
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     cmd = "Neotree",
--     branch = "v3.x",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--       "MunifTanjim/nui.nvim",
--     },
--     opts = {
--       filesystem = {
--         bind_to_cwd = false,
--         follow_current_file = {
--           enable = true,
--         },
--         filtered_items = {
--           visible = true,
--         },
--       },
--       window = {
--         position = "right",
--         mappings = {
--           ["<space>"] = "none",
--         },
--       },
--       default_component_configs = {
--         indent = {
--           with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
--           expander_collapsed = "",
--           expander_expanded = "",
--           expander_highlight = "NeoTreeExpander",
--         },
--       },
--     },
--   },
-- }
