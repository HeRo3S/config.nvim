return {
	"stevearc/conform.nvim",
	events = { "BufReadPre", "BufNewFile" },
	opts = function()
		local opts = {
			formatters = {
				ludtwig = {
					inherit = false,
					command = "ludtwig",
					args = { "-f", "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "autopep8" },
				sh = { "shfmt" },
				tex = { "latexindent" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				twig = { "djlint" },
				latex = { "latexindent" },
			},
		}
		local conform = require("conform")
		vim.keymap.set("n", "<leader>f", function()
			conform.format({ lsp_fallback = true, async = false, timeout_ms = 3000 })
		end, { desc = "Format file or range (visual mode)" })

		return opts
	end,
}
