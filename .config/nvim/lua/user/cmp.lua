local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local icons = require("user.icons")
local kind_icons = icons.kind

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = {
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item()),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<C-c>"] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Set `select` to `false` to only confirm explicitly selected items.
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.menu = ({
				luasnip = "",
				nvim_lsp = "",
				buffer = "",
				path = "",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	experimental = {
		ghost_text = true,
	},
})
