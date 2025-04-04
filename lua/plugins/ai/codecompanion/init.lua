return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		return {
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
						file = {
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						buffer = {
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						symbols = {
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
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
		}
	end,
	init = function()
		require("plugins.ai.codecompanion.lualine"):init()
		vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
		vim.keymap.set(
			{ "n", "v" },
			"<LocalLeader>a",
			"<cmd>CodeCompanionChat Toggle<cr>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set("v", "ca", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
	end,
}
