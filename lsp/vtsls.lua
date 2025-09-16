local npm_root = vim.fn.system("npm root -g"):gsub("%s+", "")
local vue_ts_plugin_path = npm_root .. "/@vue/typescript-plugin"

return {
	cmd = { "vtsls", "--stdio" },

	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"jsx",
		"tsx",
		"vue",
		"html",
	},

	root_markers = {
		"vite.config.js",
		"next.config.js",
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
		"vue.config.js",
		"nuxt.config.js",
	},

	init_options = {
		hostInfo = "neovim",
		preferences = {
			-- example: configure imports
			importModuleSpecifier = "relative",
		},
	},

	settings = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_ts_plugin_path,
				languages = { "javascript", "typescript", "vue" },
			},
		},
		typescript = {
			format = {
				indentSize = vim.o.shiftwidth,
				convertTabsToSpaces = vim.o.expandtab,
			},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = true },
			},
			preferences = {
				importModuleSpecifier = "relative",
				includePackageJsonAutoImports = "auto", -- Enable auto-imports from package.json
				allowIncompleteCompletions = true,
			},
			suggest = {
				autoImports = true,
				completeFunctionCalls = true,
			},
		},
		javascript = {
			preferences = {
				importModuleSpecifier = "relative",
				includePackageJsonAutoImports = "auto",
			},
			suggest = {
				autoImports = true,
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "all" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
			},
		},
	},
}
