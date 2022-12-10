local status, bufferline = pcall(require, "bufferline")
if not status then
	print("Error in bufferline.lua")
	return
end

bufferline.setup({
	options = {
		mode = "buffer",
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		show_close_icon = false,
		indicator = {
			icon = "▎",
		},
		color_icons = true,
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", padding = 1 },
			{ filetype = "Outline", text = "Code Outline", highlight = "Directory", padding = 1 },
		},
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
