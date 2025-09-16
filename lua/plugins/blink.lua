return {
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		config = function()
			local blink = require("blink.cmp")
			blink.setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				appearance = {
					use_nvim_cmp_as_default = true,
					nerd_font_variant = "normal",
				},
				sources = {
					default = { "lsp", "path", "buffer", "snippets" },
					-- Prioritize snippets (Emmet) for HTML-like files
					per_filetype = {
						vue = { "snippets", "lsp", "path", "buffer" },
						html = { "snippets", "lsp", "path", "buffer" },
						javascriptreact = { "snippets", "lsp", "path", "buffer" },
						typescriptreact = { "snippets", "lsp", "path", "buffer" },
					},
					providers = {
						lsp = {
							min_keyword_length = 1,
							-- Lower score for keyword completions in HTML contexts
							score_offset = 0,
						},
						path = { min_keyword_length = 2 },
						buffer = { min_keyword_length = 2 },
						snippets = {
							name = "LuaSnip",
							module = "blink.cmp.sources.snippets",
							-- Higher score for snippets (Emmet)
							score_offset = 200,
							min_keyword_length = 1,
						},
					},
				},
				keymap = {
					["<CR>"] = { "accept", "fallback" },
					-- ["<Tab>"] = { "select_next", "fallback" },
					-- ["<S-Tab>"] = { "select_prev", "fallback" },
					["<M-Space>"] = { "show", "fallback" }, -- match your old mapping
				},
				cmdline = { enabled = false },
				completion = {
					menu = {
						scrolloff = 1,
						scrollbar = false,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							scrollbar = false,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 200,
					},
				},
			})

			-- Load snippets
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { "~/.config/nvim/snippets/" }, -- The path to your custom snippets folder
			})
		end,
	},
}
