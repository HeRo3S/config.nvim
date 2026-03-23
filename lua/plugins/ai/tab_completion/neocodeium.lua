return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup({
			bin = vim.fn.exepath("codeium_language_server"),
		})
		vim.keymap.set("i", "<A-t>", neocodeium.accept)
		vim.keymap.set("i", "<A-w>", function()
			neocodeium.accept_word()
		end)
		vim.keymap.set("i", "<A-a>", function()
			neocodeium.accept_line()
		end)
		vim.keymap.set("i", "<A-n>", function()
			neocodeium.cycle_or_complete()
		end)
		vim.keymap.set("i", "<A-p>", function()
			neocodeium.cycle_or_complete(-1)
		end)
		vim.keymap.set("i", "<A-c>", function()
			neocodeium.clear()
		end)
	end,
}
