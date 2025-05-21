return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "saghen/blink.cmp", version = "*" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			--Snippet
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"tailwindcss",
					"clangd",
					"texlab",
				},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						vim.lsp.enable(server_name)
					end,
				},
			})

			local blink = require("blink.cmp")
			blink.setup({
				snippets = { preset = "luasnip" },
				sources = {
					default = { "lsp", "path", "snippets", "buffer", "dadbod" },
					per_filetype = { sql = { "dadbod" } },
					providers = {
						dadbod = { module = "vim_dadbod_completion.blink" },
					},
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
				keymap = {
					preset = "none",
					["<C-p>"] = { "select_prev", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },
					["<C-y>"] = { "select_and_accept", "fallback" },
					["<C-Space>"] = { "show_documentation", "fallback" },
					["<CR>"] = { "accept", "fallback" },
					["<Tab>"] = {},
					["<S-Tab>"] = {},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, opts)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
				end,
			})
		end,
	},
}
