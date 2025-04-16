return {
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
		init = function()
			require("plugins.ai.codecompanion.fidget-spinner"):init()
		end,
	},
}
