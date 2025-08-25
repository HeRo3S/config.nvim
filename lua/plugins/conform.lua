return {
	"stevearc/conform.nvim",
	events = { "BufReadPre", "BufNewFile" },
	opts = function()
		local conform = require("conform")
		vim.keymap.set("n", "<leader>f", function()
			conform.format({ lsp_fallback = true, async = false, timeout_ms = 3000 })
		end, { desc = "Format file or range (visual mode)" })

		conform.formatters.php_cs_fixer = {
			append_args = function()
				local cwd = "."
				return { "--config=" .. cwd .. "/.php-cs-fixer.dist.php" }
			end,
		}

		local opts = {
			-- formatters = {},
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
				php = { "php_cs_fixer" },
				nix = { "nixfmt" },
			},
		}
		return opts
	end,
}
