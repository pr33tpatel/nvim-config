return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = 1000,
    opts = {
      explorer = {
        enabled = true,
        layout = {
          cycle = false,
        },
        quickfile = {
          enabled = true,
          exclude = {"latex"}
        },
        picker = {
          enabled = true,
          matchers = {
            frecency = true,
            cwd_bonus = true,
          },
          formatters = {
            file = {
              filename_first = false,
              filename_only = false,
            },
          },
          layout = {
            preset = "telescope",
            cycle = false,
          },
        }
      }

    },
    keys = {
      { "<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit"},
      { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs"},
      { "<leader>es", function() require("snacks").explorer() end, desc = "Open Snacks Explorer"},
      { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File"},
      { "<leader>dB", function() require("snacks").bufdelete() end, desc = "Delete/Close current buffer"},

      -- Snacks Pickers
      { "<leader>pf", function() require("snacks").picker.files() end, desc = "Find Files (Snacks Picker)"},
      { "<leader>pc", function() require("snacks").picker.files({cwd = vim.fn.stdpath("config")}) end, desc = "Find Config Files"},
      { "<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep Word"},
      { "<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search Visual Selection or Word", mode = {"n", "x"} },
      { "<leader>pk", function() require("snacks").picker.keymaps() end, desc = "Search Keymaps" },

      -- Previews
      { "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select"}) end, desc = "Pick and Switch Git Branches"},
      { "<leader>tx", function() require("snacks").picker.colorschemes() end, desc = "Pick Color Schemes"},
      { "<leader>vh", function() require("snacks").picker.help() end, desc = "Help Pages"},
    }
  },
  
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile"},
    keys = {
      { "<leader>pt", function() require("snacks").picker.todo_comments() end, desc = "Todo"},
      { "<leader>pT", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME"}}) end, desc = "Todo/Fix/Fixme"},
    }
  }
}
