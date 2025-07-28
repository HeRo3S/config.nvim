return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		return {
			adapters = {
				openrouter = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "openrouter",
						formatted_name = "OpenRouter",
						env = {
							url = "https://openrouter.ai/api",
							api_key = "OPENROUTER_API_KEY",
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "qwen/qwen3-coder",
								choices = {
									"x-ai/grok-3-mini-beta",
									"qwen/qwen3-coder",
									"openai/o4-mini-high",
								},
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "openrouter",
					slash_commands = {
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
				},
				inline = {
					adapter = "openrouter",
				},
			},
			display = {
				chat = {
					window = {
						position = "right",
					},
				},
			},
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_result_in_chat = true,
					},
				},
			},
		}
	end,
	init = function()
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
