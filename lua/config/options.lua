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
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true
opt.autoindent = true
opt.cindent = true
opt.ignorecase = true
opt.smartcase = true
-- opt.wrap = true -- enable line wrapping
opt.wrap = false --disable line wrapping



-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
