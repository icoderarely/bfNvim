return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		-- Background
		vim.opt.background = "dark"

		-- Gruvbox-material options
		vim.g.gruvbox_material_background = "hard" -- 'hard', 'medium', 'soft'
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_enable_italic = true

		-- Load colorscheme
		vim.cmd("colorscheme gruvbox-material")
	end,
}
