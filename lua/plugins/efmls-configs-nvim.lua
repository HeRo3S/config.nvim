-- Register linters and formatters per language
local eslint_d = require("efmls-configs.linters.eslint_d")
local prettier_d = require("efmls-configs.formatters.prettier_d")
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local shellcheck = require("efmls-configs.linters.shellcheck")
local beautysh = require("efmls-configs.formatters.beautysh")
local flake8 = require("efmls-configs.linters.flake8")
local autopep8 = require("efmls-configs.formatters.autopep8")
local chktex = require("efmls-configs.linters.chktex")
local latexindent = require("efmls-configs.formatters.latexindent")
local djlint = require("efmls-configs.linters.djlint")
local markdownlint = require("efmls-configs.linters.markdownlint")

local languages = {
	typescript = { eslint_d, prettier_d },
	javascript = { eslint_d, prettier_d },
	typescriptreact = { eslint_d, prettier_d },
	javascriptreact = { eslint_d, prettier_d },
	lua = { luacheck, stylua },
	css = { prettier_d },
	html = { djlint, prettier_d },
	python = { flake8, autopep8 },
	sh = { shellcheck, beautysh },
	tex = { chktex, latexindent },
	markdown = { markdownlint, prettier_d },
}

-- Or use the defaults provided by this plugin
-- check doc/SUPPORTED_LIST.md for the supported languages
--
-- local languages = require('efmls-configs.defaults').languages()

local efmls_config = {
	filetypes = vim.tbl_keys(languages),
	settings = {
		rootMarkers = { ".git/" },
		languages = languages,
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
}

require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
	-- Pass your custom lsp config below like on_attach and capabilities
	--
	-- on_attach = on_attach,
	-- capabilities = capabilities,
}))
