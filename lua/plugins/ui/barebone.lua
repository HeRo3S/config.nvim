return {
	{
		"j-hui/fidget.nvim",
		tag = "v1.0.0", -- Make sure to update this to something recent!
		opts = {
			-- options
		},
		init = function()
			require("plugins.ai.codecompanion.fidget-spinner"):init()
		end,
	},
}
