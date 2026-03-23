return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	cmd = { "Copilot" },
	event = "InsertEnter",
	dependencies = {
		{
			"copilotlsp-nvim/copilot-lsp",
			init = function()
				vim.g.copilot_nes_debounce = 500
				vim.lsp.enable("copilot_ls")
				-- Normal mode <Tab> for NES (Next Edit Suggestion)
				vim.keymap.set("n", "<tab>", function()
					local bufnr = vim.api.nvim_get_current_buf()
					local state = vim.b[bufnr].nes_state
					if state then
						-- Try to jump to the start of the suggestion edit.
						-- If already at the start, then apply the pending suggestion and jump to the end of the edit.
						local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
							or (
								require("copilot-lsp.nes").apply_pending_nes()
								and require("copilot-lsp.nes").walk_cursor_end_edit()
							)
						return nil
					else
						-- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
						return "<C-i>"
					end
				end, { desc = "Accept Copilot NES suggestion", expr = true })

				-- Insert mode <Tab> for standard Copilot suggestions
				vim.keymap.set("i", "<Tab>", function()
					if require("copilot.suggestion").is_visible() then
						require("copilot.suggestion").accept()
						return ""
					end
					return "<Tab>"
				end, { desc = "Accept Copilot suggestion", expr = true, silent = true })

				vim.keymap.set("n", "<esc>", function()
					if not require("copilot-lsp.nes").clear() then
						-- fallback to other functionality
					end
				end, { desc = "Clear Copilot suggestion or fallback" })
			end,
		},
	},
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					accept_line = false,
					accept_word = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = {
				enabled = true,
				auto_refresh = true,
			},
		})
	end,
}
