local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
-- 	once = true,
-- 	callback = function()
-- 		local server_configs = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
-- 			:map(function(file)
-- 				return vim.fn.fnamemodify(file, ":t:r")
-- 			end)
-- 			:totable()
-- 		vim.lsp.enable(server_configs)
-- 	end,
-- })

-- Auto-disable diagnostics UI in C/C++ files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		ui_enabled = false
		vim.diagnostic.config({
			virtual_text = false,
			underline = false,
			signs = false,
		})
	end,
})

-- Always use 4 spaces for C/C++ indentation
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "objc", "objcpp" },
	callback = function()
		vim.bo.tabstop = 4 -- <Tab> counts for 4 spaces
		vim.bo.shiftwidth = 4 -- >> and autoindent = 4 spaces
		vim.bo.softtabstop = 4 -- typing <Tab> inserts 4 spaces
		vim.bo.expandtab = true -- convert <Tab> keypresses to spaces
	end,
})
