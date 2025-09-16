return {
	name = "cssls",
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less", "vue" },
	root_markers = { "package.json", ".git" },
	settings = {
		css = {
			validate = true,
		},
		scss = {
			validate = true,
		},
		less = {
			validate = true,
		},
	},
}
