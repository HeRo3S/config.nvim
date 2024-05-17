-- Remaps
require("hero3s.set")
require("hero3s.remap")

-- Package manager
require("hero3s.lazy")
-- Colorscheme has to wait for package manager to be setup
require("plugins.colorscheme")

-- Must-have
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.oil")

-- Versions control
require("plugins.undotree")
require("plugins.fugitive")

-- QoL plugins
require("plugins.autopair")
require("plugins.nvim-comment")
require("plugins.todo-comments")
require("plugins.efmls-configs-nvim")
require("plugins.which-key")
require("plugins.nvim-surround")

-- Markdown
require("plugins.glow")

