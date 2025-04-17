return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local custom_vague = require("lualine.themes.vague")

    -- Change Insert mode background to purple
    custom_vague.insert.a.bg = "#8a739a"
    -- Optional: set foreground color to white (or any you like)
    custom_vague.insert.a.fg = "#ffffff"
    custom_vague.insert.a.gui = "bold"

    require("lualine").setup({
      options = {
        theme = custom_vague, -- <- corrected here
      },
    })
  end,
}

