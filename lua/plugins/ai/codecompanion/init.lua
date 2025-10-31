return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		return {
			adapters = {
				http = {
					openrouter = function()
						local openrouter = require("plugins.ai.codecompanion.utils.openrouter")
						return require("codecompanion.adapters").extend(openrouter, {
							schema = {
								model = {
									default = "x-ai/grok-4-fast",
									choices = {
										"x-ai/grok-4-fast",
										"qwen/qwen3-coder",
										"openai/gpt-5-mini",
									},
								},
							},
						})
					end,
				},
				acp = {
					qwen_code_enhanced = function()
						return require("codecompanion.adapters").extend("gemini_cli", {
							name = "qwen_code_enhanced",
							formatted_name = "Qwen Code Enhanced",
							commands = {
								default = {
									"qwen",
									"--experimental-acp",
								},
							},
							defaults = {
								auth_method = "openai",
							},
							env = {
								OPENAI_API_KEY = vim.env.OPENROUTER_API_KEY,
								OPENAI_BASE_URL = "https://openrouter.ai/api/v1",
								OPENAI_MODEL = "x-ai/grok-4-fast",
							},
						})
					end,
				},
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
