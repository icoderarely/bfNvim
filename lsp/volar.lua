-- Utility function to find TypeScript SDK path
local function get_typescript_server_path(root_dir)
	-- First try to find local TypeScript installation
	local local_tsdk = vim.fs.find("node_modules/typescript/lib", {
		path = root_dir,
		upward = true,
	})[1]

	if local_tsdk then
		return local_tsdk
	end

	-- Fallback to global TypeScript installation
	local global_tsdk = vim.fn.system("npm root -g"):gsub("%s+", "") .. "/typescript/lib"
	if vim.fn.isdirectory(global_tsdk) == 1 then
		return global_tsdk
	end

	-- Final fallback - empty string will let Volar handle it
	return ""
end

local volar_init_options = {
	typescript = {
		tsdk = "",
	},
	vue = {
		hybridMode = true, -- Use hybrid mode by default (recommended)
	},
}

return {
	cmd = { "vue-language-server", "--stdio" },

	filetypes = { "vue" }, -- In hybrid mode, only handle Vue files

	root_markers = {
		"package.json",
		"vue.config.js",
		"vite.config.js",
		"vite.config.ts",
		"nuxt.config.js",
		"nuxt.config.ts",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	init_options = volar_init_options,
	-- Automatically detect and set TypeScript SDK path
	on_new_config = function(new_config, new_root_dir)
		if
			new_config.init_options
			and new_config.init_options.typescript
			and new_config.init_options.typescript.tsdk == ""
		then
			new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
		end
	end,

	settings = {
		vue = {
			-- Vue-specific settings
			completion = {
				casing = {
					props = "camel",
					tags = "pascal",
				},
			},
			codeActions = {
				enabled = true,
			},
			validation = {
				template = true,
				script = true,
				style = true,
			},
		},
	},
}

