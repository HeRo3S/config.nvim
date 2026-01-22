return {
	"sudo-tee/opencode.nvim",
	config = function()
		require("opencode").setup({
			keymap = {
				editor = {
					["<leader>ot"] = false,
				},
				input_window = {
					["<esc>"] = false,
				},
				output_window = {
					["<esc>"] = false,
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
		"folke/snacks.nvim",
	},
}
