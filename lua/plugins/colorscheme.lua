function Draw(colors)
	local colorscheme = colors or "catppuccin"
	vim.cmd.colorscheme(colorscheme)

	-- Main editor window transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	
	-- Floating windows slightly opaque for better readability
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
	vim.api.nvim_set_hl(0, "FloatNormal", { bg = "#1e1e2e" })
	vim.api.nvim_set_hl(0, "FloatNormalNC", { bg = "#1e1e2e" })
	
	-- Keep borders and titles visible
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#313244", fg = "#a6adc8" })
	vim.api.nvim_set_hl(0, "FloatBorderNC", { bg = "#313244", fg = "#a6adc8" })
	vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#313244", fg = "#cdd6f4" })
	vim.api.nvim_set_hl(0, "FloatTitleNC", { bg = "#313244", fg = "#a6adc8" })
	
	-- Scrollbar styling
	vim.api.nvim_set_hl(0, "FloatScrollbar", { bg = "#313244" })
	vim.api.nvim_set_hl(0, "FloatScrollbarNC", { bg = "#313244" })
	vim.api.nvim_set_hl(0, "FloatThumb", { bg = "#45475a" })
	vim.api.nvim_set_hl(0, "FloatThumbNC", { bg = "#45475a" })
	
	-- Subtle shadows
	vim.api.nvim_set_hl(0, "FloatShadow", { bg = "#000000", blend = 50 })
	vim.api.nvim_set_hl(0, "FloatShadowNC", { bg = "#000000", blend = 50 })
	vim.api.nvim_set_hl(0, "FloatShadowThrough", { bg = "#000000", blend = 50 })
	vim.api.nvim_set_hl(0, "FloatShadowThroughNC", { bg = "#000000", blend = 50 })
end

return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "storm",
			light_style = "day",
			terminal_colors = true,
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {

			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		},
		config = function()
			Draw()
		end,
	},
}
