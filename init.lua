require("config.lazy")
require("config.remap")
require("plugins.alpha")
require("config.options")
vim.cmd("colorscheme vague")

-- Suppress deprecation warning
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    vim.cmd("silent! lua vim.tbl_flatten = function() end")
  end
})

