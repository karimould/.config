return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.auto_reload`.
    vim.o.autoread = true

    -- Ask & submit
    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Opencode Ask" })

    -- Select action
    vim.keymap.set({ "n", "x" }, "<leader>as", function()
      require("opencode").select()
    end, { desc = "Opencode Select Action" })

    -- Add to opencode
    vim.keymap.set({ "n", "x" }, "<leader>ad", function()
      require("opencode").prompt("@this")
    end, { desc = "Opencode Add" })

    -- Toggle UI
    vim.keymap.set({ "n", "t" }, "<leader>at", function()
      require("opencode").toggle()
    end, { desc = "Opencode Toggle" })

    -- -- Half page up
    -- vim.keymap.set("n", "<leader>au", function()
    --   require("opencode").command("session.half.page.up")
    -- end, { desc = "Opencode Half Page Up" })
    --
    -- -- Half page down
    -- vim.keymap.set("n", "<leader>adn", function()
    --   require("opencode").command("session.half.page.down")
    -- end, { desc = "Opencode Half Page Down" })
  end,
}
