return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      section_separators = { right = "", left = "" },
      component_separators = "", --{ right = "", left = "" },
      theme = "vitesse",
    },
    sections = {
      lualine_a = {
        { "mode" },
        {
          "macro-recording",
          fmt = function()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
              return ""
            else
              return "Recording @" .. recording_register
            end
          end,
        },
      },
      lualine_b = {
        "branch",
        { "diff", symbols = { added = " ", modified = " ", removed = "󰮉 " } },
        "diagnostics",
      },
      lualine_c = { "filename", "searchcount" },
      lualine_x = { "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
  config = function(_, opts)
    local lualine = require("lualine")
    lualine.setup(opts)
    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        -- refresh lualine when entering record mode
        lualine.refresh({ place = { "lualine_a" } })
      end,
    })
  end,
}
