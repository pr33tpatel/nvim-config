return {

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "pyright",
                    "tsserver",
                    "lua_ls",
                }, -- Example LSP servers
            })
        end
    }
}    

