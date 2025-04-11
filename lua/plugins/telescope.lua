return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },  -- Ignore these folders
      },
      pickers = {
        find_files = {
          hidden = true,  -- Include hidden files and folders
        },
      },
    })
    vim.g.telescope_defaults = {
      find_files = {
        hidden = true,  -- Ensure hidden files are included globally
      },
    }
  end,
}
