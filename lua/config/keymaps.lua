-- keymaps go here

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
vim.keymap.set("v", "<M-S>K", ":m '<-2<CR>gv=gv", { desc = "up" })
vim.keymap.set("v", "<M-S>J", ":m '>+1<CR>gv=gv", { desc = "down" })

-- Move line up and down
vim.keymap.set("n", "<M-S>K", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("n", "<M-S>J", ":m .+1<CR>==", { desc = "Move current line down" })

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
