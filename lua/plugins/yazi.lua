return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim"
  },
  keys = {
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    -- {
    --   "<c-y>t",
    --   "<cmd>Yazi toggle<cr>",
    --   desc = "Resume the last yazi session",
    -- },
  },
  opts = {
    open_for_directories = false,
    show_hidden = true,  -- this will enable hidden files
    keymaps = {
      show_help = "5",
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
