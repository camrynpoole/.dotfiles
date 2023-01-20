-----------------------------------------------------------
-- Servers
-----------------------------------------------------------
return {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	clangd = {
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	},
}
