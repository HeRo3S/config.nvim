return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				-- anthropic = function()
				-- 	return require("codecompanion.adapters").extend("anthropic", {
				-- 		env = {
				-- 			url = "dummy_url",
				-- 			api_key = "dummy_api_key",
				-- 		},
				-- 	})
				-- end,
			},
			strategies = {
				chat = {
					adapter = "gemini",
				},
				inline = {
					adapter = "gemini",
				},
			},
		},
	},
}
