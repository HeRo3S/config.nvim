require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	check_ts = true,
})

require("nvim-treesitter.configs").setup({
	autotag = {
		enable = true,
	},
})

