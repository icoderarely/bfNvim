-- options.lua
local opt = vim.opt

-- [] general options
opt.number = true             -- show line numbers
opt.relativenumber = true     -- relative line numbers, for better navigation
opt.pumheight = 5             -- popup menu height
-- opt.undodir = '~/.somewhere'   -- set dir for undo file
opt.confirm = true            -- prompt before saving files
opt.mouse = "a"               -- enable mouse in all modes
opt.clipboard = "unnamedplus" -- system clipboard
opt.swapfile = false          -- disable swap file
opt.backup = false            -- disable backup file
opt.undofile = false          -- disable undo file
opt.fillchars = { eob = " " } -- hide tildes at the bottom of files (global setting)
opt.showmode = false          -- don't show mode, since in status line
opt.signcolumn = "yes"        -- keep signcolumn on by default
opt.breakindent = true        -- enable break indent

-- [] search settings
opt.hlsearch = true   -- highlight search results
opt.ignorecase = true -- ignore case in search (case-insensitive)
opt.smartcase = true  -- case-sensitive if uppercase in search

-- [] display settings
opt.termguicolors = true -- enable true color
opt.cursorline = true    -- highlight current line
opt.splitright = true    -- vertical splits to right
opt.splitbelow = true    -- horizontal splits below
opt.scrolloff = 5        -- minimum number of lines below/above the cursor
opt.winborder = 'rounded'

-- [] tabs and indentation
opt.tabstop = 2        -- number of spaces a tab counts
opt.softtabstop = 2    -- number of spaces a tab counts
opt.shiftwidth = 2     -- spaces for each indentation level >>(indent) <<(unindent)
opt.expandtab = true   -- convert tabs to spaces
opt.smartindent = true -- adjust indentation based on syntax of code
opt.cindent = true     -- C/C++ indentation style
opt.autoindent = true  -- copy indent from current line when starting new one
opt.breakindent = true -- if line goes beyond screen size
