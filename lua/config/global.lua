-- globals
--------------------------------------------------------------------------------
-- Set <space> as leader key
-- NOTE: Must happen before loading plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Add to your keymaps for testing
vim.keymap.set("n", "<leader>test", function()
	print("LSP clients:", vim.inspect(vim.lsp.get_clients()))
end)

vim.keymap.set("n", "<leader>cap", function()
	local clients = vim.lsp.get_clients()
	for _, client in ipairs(clients) do
		print(client.name, "supports completion:", client:supports_method("textDocument/completion"))
	end
end)
