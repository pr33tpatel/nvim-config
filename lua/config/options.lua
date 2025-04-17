local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"


-- enable system clipboard
-- opt.clipboard = "unnamedplus"



-- UI settings
opt.number = true -- show line numbers
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 10
opt.sidescrolloff = 10


-- indentation and formating
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = false -- disable line wrapping



