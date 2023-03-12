function config() 
	vim.cmd.colorscheme 'tokyonight'
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

require('tokyonight').config = config()
