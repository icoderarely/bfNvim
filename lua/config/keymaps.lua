-- keymaps go here
vim.g.mapleader = " "

-- Clear terminal/command line messages
vim.keymap.set("n", "<Esc>", function()
	-- Clear search highlighting
	vim.cmd("nohlsearch")
	-- Clear messages at the bottom
	vim.cmd("messages clear")
	-- Clear command line
	vim.cmd("echo ''")
end, { desc = "Clear terminal output and search highlight", noremap = true, silent = true })

-- Move selected text up and down
vim.keymap.set("v", "<M-K>", ":m '<-2<CR>gv=gv", { desc = "up" })
vim.keymap.set("v", "<M-J>", ":m '>+1<CR>gv=gv", { desc = "down" })

-- Move line up and down
vim.keymap.set("n", "<M-K>", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("n", "<M-J>", ":m .+1<CR>==", { desc = "Move current line down" })

-- Helix-like g-prefixed maps
vim.keymap.set("n", "gh", "0", { desc = "Goto line start" })
vim.keymap.set("n", "gl", "$", { desc = "Goto line end" })
vim.keymap.set("n", "gs", "^", { desc = "Goto first non-whitespace character" })

-- close current split window
vim.keymap.set("n", "<leader>sc", ":close<CR>", opts)

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "ff", function()
	require("conform").format()
end, { desc = "Format current file" })

-- Buffers
local has_bufferline = pcall(require, "bufferline.nvim")

vim.keymap.set(
	"n",
	"<S-h>",
	has_bufferline and "<cmd>BufferLineCyclePrev<cr>" or "<cmd>bprev<cr>",
	{ desc = "Previous buffer", noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<S-l>",
	has_bufferline and "<cmd>BufferLineCycleNext<cr>" or "<cmd>bnext<cr>",
	{ desc = "Next buffer", noremap = true, silent = true }
)

-- vim.keymap.set({ "n" }, "<C-t>", "<cmd>!g++ % -o %:r && ./%:r<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-t>", "<cmd>!/opt/homebrew/bin/g++-15 % -o %:r && ./%:r<CR>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<C-t>",
	"<cmd>!/opt/homebrew/bin/g++-15 -std=c++20 -O2 -Wall -Wextra -mmacosx-version-min=26.0 % -o %:r && ./%:r<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set({ "n" }, "<leader>cf", ":CompetiTest receive problem<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>ct", ":CompetiTest run<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>c+", ":CompetiTest add_testcase<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>c-", ":CompetiTest delete_testcase<CR>", { noremap = true, silent = true })

-- local ui_enabled = true
--
-- vim.keymap.set("n", "<leader>tv", function()
-- 	ui_enabled = not ui_enabled
-- 	if ui_enabled then
-- 		vim.diagnostic.config({
-- 			virtual_text = true,
-- 			underline = false,
-- 			update_in_insert = false,
-- 			severity_sort = true,
-- 			float = {
-- 				border = "rounded",
-- 				source = true,
-- 			},
-- 			signs = {
-- 				text = {
-- 					[vim.diagnostic.severity.ERROR] = " ",
-- 					[vim.diagnostic.severity.WARN] = " ",
-- 					[vim.diagnostic.severity.INFO] = "󰋽 ",
-- 					[vim.diagnostic.severity.HINT] = "󰌶 ",
-- 				},
-- 				numhl = {
-- 					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
-- 					[vim.diagnostic.severity.WARN] = "WarningMsg",
-- 				},
-- 			},
-- 		})
-- 		vim.notify("Diagnostics UI enabled")
-- 	else
-- 		vim.diagnostic.config({
-- 			virtual_text = false,
-- 			underline = false,
-- 			signs = false,
-- 		})
-- 		vim.notify("Diagnostics UI hidden")
-- 	end
-- end, { desc = "Toggle diagnostics UI" })
