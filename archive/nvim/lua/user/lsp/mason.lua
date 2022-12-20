local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

-- list servers here
local servers = {
	"sumneko_lua",
	"pyright",
	"clangd",
	"emmet_ls",
	"tsserver",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities
local servers_config = require("user.lsp.servers")

mason_lspconfig.setup_handlers({
	function(server)
		local config = servers_config[server] or {}
		config.on_attach = on_attach
		config.capabilities = capabilities
		lspconfig[server].setup(config)
	end,
})
