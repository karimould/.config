-- codeium plugin
return {
  "Exafunction/codeium.vim",
  config = function()
    vim.keymap.set("i", "<M-a>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<M-]>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<M-[>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<A-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true })
  end,
}

-- GitHub Copilot
-- https://github.com/zbirenbaum/copilot.lua
-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--       require("copilot").setup({
--         suggestion = {
--           auto_trigger = true,
--           debounce = 150,
--           keymap = {
--             accept = "<M-a>",
--             prev = "<M-[>",
--             next = "<M-]>",
--             dismiss = "<C-x>",
--           },
--         },
--       })
--     end,
--   },
--   {
--     "CopilotC-Nvim/CopilotChat.nvim",
--     event = "VeryLazy",
--     opts = {
--       show_help = "no",
--       prompts = {
--         Explain = "Explain how it works. Please use a simple and easy-to-understand example.",
--         Review = "Review the following code and provide concise suggestions.",
--         Tests = "Briefly explain how the selected code works, then generate unit tests.",
--         Refactor = "Refactor the code to improve clarity and readability.",
--       },
--     },
--     build = function()
--       vim.defer_fn(function()
--         vim.cmd("UpdateRemotePlugins")
--         vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
--       end, 3000)
--     end,
--     keys = {
--       { "<leader>acb", ":CopilotChatBuffer<cr>", desc = "CopilotChat - Buffer" },
--       { "<leader>ace", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
--       { "<leader>act", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
--       {
--         "<leader>act",
--         "<cmd>CopilotChatVsplitToggle<cr>",
--         desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
--       },
--       {
--         "<leader>acv",
--         ":CopilotChatVisual",
--         mode = "x",
--         desc = "CopilotChat - Open in vertical split",
--       },
--       {
--         "<leader>acp",
--         ":CopilotChatInPlace<cr>",
--         mode = { "n", "x" },
--         desc = "CopilotChat - Run in-place code",
--       },
--       {
--         "<leader>acf",
--         "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
--         desc = "CopilotChat - Fix diagnostic",
--       },
--     },
--   },
-- }
