return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"blade",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"lua",
		"vue",
	},
	root_markers = { "index.html", "*.vue", ".git" },
	init_options = { provideFormatter = true },

	settings = {
		HTML = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
}
