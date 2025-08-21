return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" }, -- load earlier
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"cpp",
				"lua",
				"javascript",
				"html",
				"python",
				"go",
				"tsx",
				"typescript",
				"css",
				"json",
			},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>", -- set to `false` to disable one of the mappings
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})
	end,
}
