return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- List the languages you want here, or use "all"
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "go",
        "c",
        "cpp",
        "rust",
        "html",
        "css" },
      highlight = { enable = true },
      indent = { enable = true },
      -- Optional: for incremental selection, rainbow brackets, etc.
    })
  end,
}

