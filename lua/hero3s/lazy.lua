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
		{ "folke/tokyonight.nvim", priority = 1000 },
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		-- Status bar
		{ "nvim-lualine/lualine.nvim" },
		-- Enhanced file browser
		{ import = "plugins.oil" },
		-- File navigation
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		},
		-- Fuzzy finder
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		-- Treesitter
		{ import = "plugins.treesitter" },
		-- Version control
		{ import = "plugins.undotree" },
		{ import = "plugins.fugitive" },
		-- LSP
		{ import = "plugins.lsp" },
		-- Formatter
		{ import = "plugins.efmls-configs-nvim" },
		-- Markdown
		{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
		-- Database
		{ import = "plugins.dadbod" },
		-- QoL plugins
		{ import = "plugins.qol" },
		{ import = "plugins.noice" },
	},
})
