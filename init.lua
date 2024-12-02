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
require("plugins.harpoon")

-- Versions control
require("plugins.undotree")
require("plugins.fugitive")

-- QoL plugins
require("plugins.efmls-configs-nvim")

-- Markdown
require("plugins.glow")
