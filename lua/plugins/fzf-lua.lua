return {
	"ibhagwan/fzf-lua",
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
		files = {
			prompt = "Files❯ ",
			git_icons = false,
			file_icons = true,
			color_icons = true,

			cmd = [[fd --color=never --type f --type l --exclude .git --exclude node_modules --exclude .next --exclude dist --exclude build --exclude coverage]],
		},
		grep = {
			cmd = "rg --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!node_modules' -g '!.git' -g '!.next' -g '!dist' -g '!build' -g '!coverage' -e",
		},
	},
	keys = {
		{
			"<leader>sf",
			function()
				require("fzf-lua").files()
			end,
			desc = "[S]earch [F]iles in project directory",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep()
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
