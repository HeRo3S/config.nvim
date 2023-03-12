local builtin = require('telescope.builtin')

--telescope.keys({
--	{"<leader>pf","<cmd>Telescope find_files<cr>", desc = "Find files"},
--	{"<C-p>", "<cmd>Telescope git_files<cr>",desc = "Find git files"},
--	{"<leader>ps", function() 
--		require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ")})
--	end, desc = "Find strings"},
--})

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find git files" })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end, { desc = "Find strings" })
