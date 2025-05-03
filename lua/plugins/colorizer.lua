return {
  "norcalli/nvim-colorizer.lua",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("colorizer").setup(
      -- {
    --   "*",
    --   "!vim",
    --   "!help",
    -- }, {
    --   RGB = true, -- #RGB hex codes
    --   RRGGBB = true, -- #RRGGBB hex codes
    --   names = false, -- "Name" codes like Blue or blue
    --   RRGGBBAA = true, -- #RRGGBBAA hex codes
    --   rgb_fn = true, -- CSS rgb() and rgba() functions
    --   hsl_fn = true, -- CSS hsl() and hsla() functions
    -- }
    )
  end,
}
