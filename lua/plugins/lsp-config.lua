return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require("lspconfig").lua_ls.setup({})
            require("lspconfig").ts_ls.setup({})


            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- go to definition 
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {}) -- go to declaration 
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- 
        end
    },
    {
        vim.diagnostic.config({
            virtual_text = {
                prefix = "❗", -- or "", "", "❗", "❗" , "●", (empty string for no prefix)
                spacing = 2,
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    }
}
