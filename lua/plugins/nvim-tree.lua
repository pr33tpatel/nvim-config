return{
  "nvim-tree/nvim-tree.lua",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.g.nvim_tree_respect_buf_cwd = 1

    nvimtree.setup({
      view = {
        width = 35,
      },
      renderer =  {

      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = ""

          },
        },
      },
      },
      -- change folder arrow icons

      git = {
        ignore = false
      },

      -- used to open nvim-tree in currently opened file
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ep", "<cmd>NvimTreeToggle<CR>", { desc = "toggle file explorer"})
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "toggle file explorer finder"})
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "collapse file explorer "})
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer"})
  end
}
