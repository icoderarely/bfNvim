return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		winopts = {
			hls = {
				normal = "Normal",
				border = "Normal",
				cursor = "Cursor",
				search = "IncSearch",
			},
		},
	},
	keys = {
		{
			"<leader>sf",
			function()
				require("fzf-lua").files({
					actions = {
						["default"] = require("fzf-lua").actions.file_edit,
					},
				})
			end,
			desc = "[S]earch [F]iles in projet directory",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep({
					actions = {
						["default"] = require("fzf-lua").actions.file_edit, -- open file directly
					},
				})
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Live grep current buffer",
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[S]earch [B]uiltin commands",
		},
	},
}
