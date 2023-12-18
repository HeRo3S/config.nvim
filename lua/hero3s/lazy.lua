local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

require("lazy").setup({
	spec = {
		-- Colorscheme
		{
			"folke/tokyonight.nvim",
			priority = 1000,
		},
		-- Fuzzy finder
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.1",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		-- Version control
		{
			"mbbill/undotree",
		},
		{
			"tpope/vim-fugitive",
		},
		-- LSP
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{ "L3MON4D3/LuaSnip" },
		-- Formatter
		{
			"creativenull/efmls-configs-nvim",
			version = "v1.x.x", -- version is optional, but recommended
			dependencies = { "neovim/nvim-lspconfig" },
		},
		-- QoL plugins
		{
			"folke/which-key.nvim",
		},
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
		},
		{
			"windwp/nvim-autopairs",
		},
		{
			"terrortylor/nvim-comment",
		},
		{
			"folke/todo-comments.nvim",
		},
	},
})
