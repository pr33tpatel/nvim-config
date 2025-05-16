vim.g.mapleader = " " -- spacebar as leader
vim.g.maplocalleader = "\\" -- backslash as local leader

local keymap = vim.keymap.set -- shorten function name
local opts = { noremap = true, silent = true } -- default options

-- navigation keybinds
keymap("i", "jk", "<Esc>", { noremap = false, silent = false })

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<C-d>", "<C-d>zz") -- keep half page down in middle
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "n", "nzzzv") -- keep search results in  middle
keymap("n", "N", "Nzzzv")

-- undotree keybinds
keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = false })
-- Telescope keybinds
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fz", "<cmd>Telescope zoxide list<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- file navigation
-- keymap("n", "<leader>ep", "<cmd>Ex<CR>", opts)

-- toggle Copilot
-- copliot, help me display a message when copilot is enabled or disabled
-- copilot, help me display a message when copilot is enabled or disabled on the line below
keymap("n", "<leader>cpt", "<cmd>Copilot toggle<CR>", { noremap = true, silent = false })
-- keymap("n", "<leader>cpd", "<cmd>Copilot disable<CR>", {function()
--   vim.api.nvim_echo({{"Copilot disabled", "WarningMsg"}}, false, {})
-- end, noremap = true, silent = false})
vim.keymap.set("n", "<leader>cpd", function()
  vim.cmd("Copilot disable")
  vim.api.nvim_echo({{"Copilot has been disabled", "WarningMsg"}}, false, {})
end, { noremap = true, desc = "Disable Copilot" })

vim.keymap.set("n", "<leader>cpe", function()
  vim.cmd("Copilot enable")
  vim.api.nvim_echo({{"Copilot has been enabled", "WarningMsg"}}, false, {})
end, { noremap = true, desc = "Enable Copilot" })

-- yank to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', opts)
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', opts)

-- paste to system clipboard
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', opts)
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', opts)

-- buffer management
keymap("n", "<leader>bq", "<cmd>bd<CR>", { desc = "close current buffer", noremap = false, silent = false })

-- search and highlight management
keymap("n", "<Esc>h", "<cmd>nohlsearch<CR>", { desc = "remove highlighting", noremap = false, silent = false })

-- split windows
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", opts) -- vertical split
keymap("n", "<leader>sh", "<cmd>split<CR>", opts) -- horizontal split

--better window management
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

--resize windows
vim.api.nvim_set_keymap("n", "<C-down>", "<cmd>resize +1<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-up>", "<cmd>resize -1<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-right>", "<cmd>vertical resize -1<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-left>","<cmd>vertical resize +1<CR>", opts)

-- save file
keymap("n", "<leader>w", "<cmd>w<CR>", opts)
