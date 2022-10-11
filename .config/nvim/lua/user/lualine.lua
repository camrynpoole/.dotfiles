local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- blue vscode statusline
local theme = function()
	local colors = {
		white = "#FFFFFF",
		blue = "#3478C6",
	}
	return {
		inactive = {
			a = { fg = colors.white, bg = colors.blue, gui = "bold" },
			b = { fg = colors.white, bg = colors.blue },
			c = { fg = colors.white, bg = colors.blue },
		},
		visual = {
			a = { fg = colors.white, bg = colors.blue, gui = "bold" },
			b = { fg = colors.white, bg = colors.blue },
			c = { fg = colors.white, bg = colors.blue },
		},
		replace = {
			a = { fg = colors.white, bg = colors.blue, gui = "bold" },
			b = { fg = colors.white, bg = colors.blue },
			c = { fg = colors.white, bg = colors.blue },
		},
		normal = {
			a = { fg = colors.white, bg = colors.blue, gui = "bold" },
			b = { fg = colors.white, bg = colors.blue },
			c = { fg = colors.white, bg = colors.blue },
		},
		insert = {
			a = { fg = colors.white, bg = colors.blue, gui = "bold" },
			b = { fg = colors.white, bg = colors.blue },
			c = { fg = colors.white, bg = colors.blue },
		},
		command = {
			a = { fg = colors.white, bg = colors.blue, gui = "bold" },
			b = { fg = colors.white, bg = colors.blue },
			c = { fg = colors.white, bg = colors.blue },
		},
	}
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	colored = false,
}

local get_line_col = function()
	return " Ln %l, Col %c "
end

local spaces = function()
	return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- display lsp name, if no lsp then display nothing
local lsp_server_name = function()
	local msg = " "
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return " " .. client.name
		end
	end
	return msg
end

lualine.setup({
	options = {
		refresh = { statusline = 100 },
		globalstatus = true,
		icons_enabled = true,
		theme = theme(),
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = { { "branch", icon = "" } },
		lualine_c = { diagnostics, "mode" },
		lualine_x = {
			{ get_line_col },
			{ spaces },
			{ lsp_server_name, icons_enabled = true },
		},
		lualine_y = { filetype },
		lualine_z = {},
	},
})
