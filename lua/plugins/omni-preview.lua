return {
  "sylvanfranklin/omni-preview.nvim",
  dependencies = {
    -- typst 
    { 'chomosuke/typst-preview.nvim', lazy = true },
    -- CSV
    { 'hat0uma/csvview.nvim',         lazy = true },
  },
  opts = {},
keys = {
  {
    "<leader>op",
    function()
      vim.cmd("OmniPreview start")
      vim.notify("OmniPreview started!", vim.log.levels.INFO, { timeout = 3000 }) -- 3 seconds
    end,
    desc = "OmniPreview Start"
  },
  {
    "<leader>opc",
    function()
      vim.cmd("OmniPreview stop")
      vim.notify("OmniPreview stopped!", vim.log.levels.INFO, { timeout = 3000 }) -- 3 seconds
    end,
    desc = "OmniPreview Stop"
  },
}

}
