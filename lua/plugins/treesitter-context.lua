return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		enable = true,
		max_lines = 3, -- how many lines of context to show
		min_window_height = 0,
		line_numbers = true,
		multiline_threshold = 20,
		trim_scope = "outer",
		mode = "cursor", -- top based on cursor, not window
	},
}
