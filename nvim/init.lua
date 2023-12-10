require("/config/keybindings")
-- Install the Lazy.nvim plugin manager.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing Lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("Done")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = true,
  },
  checker = {
    enabled = false,
    notify = false,
  },
})

require("/config/commands")
require("/config/options")
