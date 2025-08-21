return {
	cmd = { "vtsls", "--stdio" },

	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},

	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },

	init_options = {
    hostInfo = "neovim",
    preferences = {
      -- example: configure imports
      importModuleSpecifier = "relative",
    },
  },

  settings = {
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
    },
    javascript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
    },
  },
}
