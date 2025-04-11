return {
  "abecodes/tabout.nvim",
  dependencies = { "nvim-treesitter", "hrsh7th/nvim-cmp" },
  config = function()
    require("tabout").setup({
      tabkey = "<Tab>", -- Use Tab to exit brackets/quotes
      act_as_tab = true,
      enable_backwards = true,
      completion = true,
      ignore_beginning = true,
    })
  end,
}
