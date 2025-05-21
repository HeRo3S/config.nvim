return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		workspaces = {
			{
				name = "second-brain",
				path = "~/personal/second-brain/",
			},
		},
		daily_notes = {
			folder = "notes/dailies",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			default_tags = { "daily-notes" },
			template = nil,
		},
		ui = {
			enable = false,
		},
	},
	keys = {
		{ "<leader>on", "<cmd>ObsidianToday<cr>", desc = "Open today's note in Obsidian" },
		{ "<leader>oo", "<cmd>ObsidianNew ", desc = "Open today's note in Obsidian" },
		{ "<leader>op", "<cmd>ObsidianSearch<cr>", desc = "Search in Obsidian" },
	},
}
