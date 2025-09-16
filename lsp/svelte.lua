return {
	-- cmd = { "svelte-language-server", "--stdio" },
	cmd = { "svelteserver", "--stdio" },

	filetypes = {
		"svelte",
	},

	root_markers = {
		"package.json",
		"svelte.config.js",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},

	init_options = {
		hostInfo = "neovim",
	},

	settings = {
		svelte = {
			plugin = {
				-- Enable emmet completions inside Svelte
				emmetCompletions = true,
			},
		},
		typescript = {
			enable = true,
		},
	},
}
