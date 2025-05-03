return {
    {
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				-- optional configuration here
				transparent = true,
				style = {
					-- "none" is the same thing as default. But "italic" and "bold" are also valid options
					boolean = "bold",
					number = "none",
					float = "none",
					error = "bold",
					comments = "italic",
					conditionals = "none",
					functions = "none",
					headings = "bold",
					operators = "none",
					strings = "none",
					variables = "none",

					-- keywords
					keywords = "none",
					keyword_return = "italic",
					keywords_loop = "none",
					keywords_label = "none",
					keywords_exception = "none",

					-- builtin
					builtin_constants = "none",
					builtin_functions = "none",
					builtin_types = "none",
					builtin_variables = "none",
				},
        colors = {
          --  func = "#bc96b0",
          keyword = "#8be9fd",
          --   -- keyword = "#787bab",
          variables = "#ffffff",
          --     --  keyword = "#8588b3",
          string = "#bc96b0",
          --           string = "#8a739a",
          -- string = "#f2e6ff",
          -- --     -- number = "#f2e6ff",
          -- string = "#d8d5b1",
          number = "#8f729e",
				},

			})
		end,
	},
  {
    "folke/tokyonight.nvim"
  },
  {
    "binhtran432k/dracula.nvim"
  },

}


