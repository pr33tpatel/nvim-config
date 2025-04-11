require("config.lazy")
require("config.remap")
require("config.options")
vim.cmd("colorscheme vague")

-- setup LSP
local lspconfig = require('lspconfig')

-- example for Pyright (Python LSP)
lspconfig.pyright.setup{}

lspconfig.lua_ls.setup{}
