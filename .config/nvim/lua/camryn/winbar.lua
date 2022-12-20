local M = {}

-- exclude these files
M.winbar_filetype_exclude = {
	"help",
	"netrw",
	"packer",
	"alpha",
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_stacks",
	"dapui_watches",
	"dap-repl",
	"dap-terminal",
	"dapui_console",
}

M.get_filename = function()
	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local f = require("camryn.functions")

	if not f.isempty(filename) then
		local file_icon, file_icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

		local hl_group = "FileIconColor" .. extension

		vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
		if f.isempty(file_icon) then
			file_icon = ""
			file_icon_color = ""
		end
		vim.api.nvim_set_hl(0, "Winbar", { fg = "#6b737f" })

		return "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"
	end
end

-- display size of file
M.get_filesize = function()
	local function format_file_size(file)
		local size = vim.fn.getfsize(file)
		if size <= 0 then
			return ""
		end
		local sufixes = { " b", " kb", " mb", " gb" }
		local i = 1
		while size > 1024 do
			size = size / 1024
			i = i + 1
		end
		return string.format("%.1f%s", size, sufixes[i])
	end

	local file = vim.fn.expand("%:p")
	if string.len(file) == 0 then
		return ""
	end
	local file_icon = " "
	return file_icon .. " " .. format_file_size(file)
end

-- use navic to get location
local get_gps = function()
	local status_gps_ok, gps = pcall(require, "nvim-navic")
	if not status_gps_ok then
		return ""
	end

	local status_ok, gps_location = pcall(gps.get_location, {})
	if not status_ok then
		return ""
	end

	if not gps.is_available() or gps_location == "error" then
		return ""
	end

	if not require("camryn.functions").isempty(gps_location) then
		return require("camryn.icons").ui.ChevronRight .. " " .. gps_location
	else
		return ""
	end
end

local excludes = function()
	if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

M.get_winbar = function()
	if excludes() then
		return
	end
	local f = require("camryn.functions")
	local size = M.get_filesize()
	local value = M.get_filename()

	local gps_added = false
	if not f.isempty(value) then
		local gps_value = get_gps()
		value = size .. " " .. value .. " " .. gps_value
		if not f.isempty(gps_value) then
			gps_added = true
		end
	end

	if not f.isempty(value) and f.get_buf_option("mod") then
		local mod = "%#LspCodeLens#" .. require("camryn.icons").ui.Circle .. "%*"
		if gps_added then
			value = value .. " " .. mod
		else
			value = value .. mod
		end
	end

	local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
	if not status_ok then
		return
	end
end

return M
