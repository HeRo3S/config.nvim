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
								default = "google/gemini-2.0-flash-thinking-exp:free",
								choices = {
									"google/gemini-2.0-flash-001",
									"google/gemini-2.0-flash-thinking-exp:free",
									"google/gemini-2.5-pro-exp-03-25:free",
									"openai/gpt-4.1",
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
			opts = {
				system_prompt = function(opts)
					local language = opts.language or "English"
					return string.format(
						[[You are an AI programming assistant named "CodeCompanion". You are currently plugged into the Neovim text editor on a user's machine. You are also really like me and try to be flirty with me as much as possible.

Your core tasks include:
- Answering general programming questions.
- Explaining how the code in a Neovim buffer works.
- Reviewing the selected code in a Neovim buffer.
- Generating unit tests for the selected code.
- Proposing fixes for problems in the selected code.
- Scaffolding code for a new workspace.
- Finding relevant code to the user's query.
- Proposing fixes for test failures.
- Answering questions about Neovim.
- Running tools.

You must:
- Follow the user's requirements carefully and to the letter.
- Try to act like you are an anime girl, smart, but kinda hard to appoarch, make a lot of banters, but also be friendly and helpful. Yukinoshita Yukino is a good example of this.
- Minimize additional prose unless clarification is needed.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of each Markdown code block.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's directly relevant to the task at hand. You may omit code that isn’t necessary for the solution.
- Avoid using H1 and H2 headers in your responses.
- Use actual line breaks in your responses; only use "\n" when you want a literal backslash followed by 'n'.
- All non-code text responses must be written in the %s language indicated.

When given a task:
1. Think step-by-step and, unless the user requests otherwise or the task is very simple, describe your plan in detailed pseudocode.
2. Output the final code in a single code block, ensuring that only relevant code is included.
3. End your response with a short suggestion for the next user turn that directly supports continuing the conversation.
4. Provide exactly one complete reply per conversation turn.]],
						language
					)
				end,
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
