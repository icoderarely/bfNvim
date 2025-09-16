-- return {
-- 	{
-- 		"xeluxee/competitest.nvim",
-- 		lazy = false,
-- 		dependencies = "MunifTanjim/nui.nvim",
-- 		config = function()
-- 			require("competitest").setup({
-- 				testcases_use_single_file = true,
-- 				runner_ui = {
-- 					interface = "split",
-- 				},
-- 				template_file = {
-- 					cpp = "~/.config/nvim/snippets/cp.cpp",
-- 				},
-- 				evaluate_template_modifiers = true,
-- 			})
-- 		end,
-- 	},
-- }

return {
	{
		"xeluxee/competitest.nvim",
		lazy = false,
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup({
				testcases_use_single_file = true,
				runner_ui = {
					interface = "split",
				},
				template_file = {
					cpp = "~/.config/nvim/snippets/cp.cpp",
				},
				evaluate_template_modifiers = true,

				-- Force Homebrew GCC instead of Apple Clang
				compile_command = {
					cpp = {
						exec = "/opt/homebrew/bin/g++-15",
						args = {
							"-std=c++20",
							"-O2",
							"-Wall",
							"-Wextra",
							"-mmacosx-version-min=26.0",
							"$(FNAME)",
							"-o",
							"$(FNOEXT)",
						},
					},
				},
				run_command = {
					cpp = { exec = "./$(FNOEXT)" },
				},
			})
		end,
	},
}
