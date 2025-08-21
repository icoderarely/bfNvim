-- Mason PATH is handled by core.mason-path
vim.lsp.enable({
	"lua_ls",
	-- "gopls",
	"vtsls",
	-- "tailwindcss",
	"html_lsp",
	-- "cssls",
	-- "emmet_ls",
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      -- vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      -- vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<M-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

-- LSP servers are automatically managed by Mason
-- Use :MasonVerify to check which tools are Mason-managed

vim.diagnostic.config({
	-- virtual_text = true,
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
	underline = true,
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
