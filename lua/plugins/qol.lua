return {
	{
		"folke/which-key.nvim",
		opts = {
			delay = function(ctx)
				return ctx.plugin and 0 or 1000
			end,
		},
	},
	{ "folke/todo-comments.nvim", opts = {} },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
            -- stylua: ignore start
		    { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
			-- stylua: ignore end
		},
	},
	{ "terrortylor/nvim-comment" },
	{ "windwp/nvim-autopairs", opts = {
		disable_filetype = { "TelescopePrompt", "vim" },
		check_ts = true,
	} },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				-- per_filetype = {
				-- 	["html"] = {
				-- 		enable_close = false,
				-- 	},
				-- },
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
		keys = {
			{ "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
