-- blue vscode statusline
local theme = function()
	local colors = {
		white = "#FFFFFF",
		blue = "#007acc",
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
