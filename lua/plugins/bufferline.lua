return {
  "akinsho/bufferline.nvim",
  enabled = false,
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup{
      options = {
        mode = "buffers",
        separator_style = "slant",
      }
    }
  end
}

