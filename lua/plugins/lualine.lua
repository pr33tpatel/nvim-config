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
        -- section_separators = "",
        component_separators = "",
      },
      sections = {
        -- lualine_a = {'mode'}, lualine_c = {'filename'},
        lualine_a = {'mode'},
        lualine_b = {
          { 'buffers',
            buffers_color = {
              active = { fg = '#FFFFFF', bg = '#005F87', gui = 'bold' },
              inactive = { fg = '#888888', bg = '#222222' }
            },
            alternate_file = "",
            modified = "x"
          }
        },        -- lualine_c = {'filename'},
        lualine_c = {'branch', 'diff', 'diagnostics'},
        lualine_x = {'encoding', 'fileformat', 'filetype',},
        lualine_y = {'progress'},
        lualine_z = {'location'}

      },
    })
  end,
}

