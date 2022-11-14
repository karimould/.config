require("gitsigns").setup({
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Actions
		map("n", "<leader>gd", gs.diffthis)
	end,
})
-- keybind for lazy git
vim.keymap.set("n", "<leader>gg", ":LazyGit <CR>", {})
