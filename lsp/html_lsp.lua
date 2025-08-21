return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"blade",
		"javascriptreact",
		"typescriptreact",
		"svelte",
	},
	root_markers = { "index.html", ".git" },
	init_options = { provideFormatter = true },

  settings = {
    HTML = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
    }
  }
}
