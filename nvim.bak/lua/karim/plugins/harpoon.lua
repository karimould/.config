local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end
telescope.load_extension("harpoon")

local silent = { silent = true }
local keymap = vim.api.nvim_set_keymap
vim.keymap.set("n","<leader>ha", function()
	require("harpoon.mark").add_file()
end, silent)
vim.keymap.set("n","<leader>hu", function()
	require("harpoon.ui").toggle_quick_menu()
end, silent)
vim.keymap.set("n", "<leader>h1", function()
	require("harpoon.ui").nav_file(1)
end, silent)
vim.keymap.set("n","<leader>h2", function()
	require("harpoon.ui").nav_file(2)
end, silent)
vim.keymap.set("n","<leader>h3", function()
	require("harpoon.ui").nav_file(3)
end, silent)
vim.keymap.set("n","<leader>h4", function()
	require("harpoon.ui").nav_file(4)
end, silent)
vim.keymap.set("n","<leader>h5", function()
	require("harpoon.ui").nav_file(5)
end, silent)
