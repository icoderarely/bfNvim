-- Mason PATH is handled by core.mason-path
vim.lsp.enable({
	"lua_ls",
	-- "gopls",
	"vtsls",
	-- "tailwindcss",
	"html_lsp",
	"cssls",
	"python",
	"clangd",
	"gopls",
	"svelte",
	-- "cssls",
	"emmet_ls",
	"volar",
})

-- Autocommands for LSP setup
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			local opts = { buffer = ev.buf, silent = true }

			-- Common LSP keymaps
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

			-- TypeScript / JavaScript (vtsls) specific commands
			if client.name == "vtsls" then
				-- Organize imports
				vim.keymap.set("n", "<leader>oi", function()
					vim.lsp.buf.code_action({
						context = { only = { "source.organizeImports" } },
						apply = true,
					})
				end, opts)

				-- Remove unused imports
				vim.keymap.set("n", "<leader>ru", function()
					vim.lsp.buf.code_action({
						context = { only = { "source.removeUnused" } },
						apply = true,
					})
				end, opts)

				-- Add missing imports
				vim.keymap.set("n", "<leader>ai", function()
					vim.lsp.buf.code_action({
						context = { only = { "source.addMissingImports" } },
						apply = true,
					})
				end, opts)

				-- Fix all
				vim.keymap.set("n", "<leader>fi", function()
					vim.lsp.buf.code_action({
						context = { only = { "source.fixAll" } },
						apply = true,
					})
				end, opts)
			end
		end
	end,
})

-- Diagnostics setup
vim.diagnostic.config({
	virtual_text = true,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
