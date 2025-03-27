return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					schema = {
						model = {
							default = "gemini-2.5-pro-exp-03-25",
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "gemini",
				slash_commands = {
					codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
				},
				tools = {
					vectorcode = {
						description = "Run VectorCode to retrieve the project context.",
						callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
					},
				},
			},
			inline = {
				adapter = "gemini",
			},
		},
		display = {
			chat = {
				window = {
					position = "right",
				},
			},
		},
	},
	init = function()
		require("plugins.ai.codecompanion.lualine"):init()
	end,
}
