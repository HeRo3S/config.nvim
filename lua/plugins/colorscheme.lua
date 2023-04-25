require("tokyonight").setup({
	style = "storm",
	light_style = "day",
	terminal_colors = true,
})

vim.cmd([[colorscheme tokyonight]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
