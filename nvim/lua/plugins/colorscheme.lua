-- return {
--   "2nthony/vitesse.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     -- load the colorscheme here
--     require("vitesse").setup({
--       transparent_background = true,
--       transparent_float_background = true,
--       reverse_visual = true,
--       dim_nc = true,
--       cmp_cmdline_disable_search_highlight_group = true,
--       diagnostic_virtual_text_background = true,
--     })
--     vim.cmd("colorscheme vitesse")
--   end,
--   dependencies = {
--     "tjdevries/colorbuddy.nvim",
--   },
-- }
return {
  "catppuccin/nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      -- custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },

      custom_highlights = function(colors)
        local custom_highlights_table = {
          CursorLine = { bg = "#3a3b3c" },
          ColorColumn = { bg = "#4e4e4e" },
          TabLineFill = { bg = "#bbc2cf" },
          Pmenu = { bg = "#090d24" },
          NormalFloat = { bg = "#090d24" },
          Visual = { bg = "#61677d", style = { "bold" } },
          HighlightOnYank = { bg = "#71778d" }, -- see settings for this

          CursorLineNr = { fg = "#e2e209" },
          SignColumn = { fg = "#a8a8a8" },
          LineNr = { fg = "#8a8a8a" },
          Comment = { fg = "#aaaaaa" },
          NonText = { fg = "#729ecb", style = { "bold" } },
          VertSplit = { fg = "NONE", style = { "reverse" } },
          StatusLine = { fg = "NONE", style = { "bold", "reverse" } },
          StatusLineNC = { fg = "NONE", style = { "reverse" } },
          MoreMsg = { fg = "SeaGreen", style = { "bold" } },
          MatchParen = { fg = "#87ff00", style = { "bold" } },

          -- Search       = { fg='#c6d0f5', bg='#506373' },
          -- CurSearch    = { fg='#506373', bg='#c6d0f5' },
        }
        -- if vim.bo.filetype == 'elixir' then
        --   local my_colors_palette = require('catppuccin.palettes').get_palette(my_flavour)
        --   custom_highlights_table['@function'] = { fg = my_colors_palette.yellow }
        --   custom_highlights_table['@method']   = { fg = my_colors_palette.yellow }
        --   custom_highlights_table['@type']     = { fg = my_colors_palette.blue }
        -- end
        return custom_highlights_table
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"}
