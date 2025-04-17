return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", ".fonts/", ".vscode/extensions/", ".cargo/", ".cache/"},  -- Ignore these folders
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
    end
  },
  {

    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup ({
        extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      }
    })
          require("telescope").load_extension("ui-select")
    end
  },
}
