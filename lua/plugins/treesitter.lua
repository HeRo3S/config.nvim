return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			local ts_parsers = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"bash",
				"html",
				"css",
				"latex",
			}

			require("nvim-treesitter").install(ts_parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = ts_parsers,
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
