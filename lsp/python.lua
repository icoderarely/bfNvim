return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		".git",
		"Pipfile",
		"pyproject.toml",
		"basedpyrightconfig.json",
		"requirements.txt",
		"setup.cfg",
		"setup.py",
	},

	settings = {
		basedpyright = {
			disableOrganizeImports = false,
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic", -- "off", "basic", "strict"
				diagnosticMode = "openFilesOnly", -- or "workspace"
			},
		},
	},

	single_file_support = true,
}
