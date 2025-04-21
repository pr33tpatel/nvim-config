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
        ensure_installed = { "lua_ls", "ts_ls", "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Global on_attach for all LSP servers
      local on_attach = function()
        local current_bufnr = vim.api.nvim_get_current_buf()
        vim.lsp.inlay_hint.enable(true, { bufnr = current_bufnr })
        -- Common keymaps for all LSPs
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = current_bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = current_bufnr })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer =current_bufnr })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer =  current_bufnr })
      end

      -- Lua LS
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            hint = { enable = true }
          }
        },
        on_attach = on_attach
      })

      -- TypeScript/JavaScript
      require("lspconfig").ts_ls.setup({
        capabilities = capabilities,
        settings = {
          javascript = {
            inlayHints = {
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true }
            }
          },
          typescript = {
            inlayHints = {
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true }
            }
          }
        },
        on_attach = on_attach
      })

      -- Clangd
      require("lspconfig").clangd.setup({
        capabilities = capabilities,
        settings = {
          clangd = {
            InlayHints = {
              Enabled = true,
              ParameterNames = true,
              DeducedTypes = true
            }
          }
        },
        on_attach = on_attach
      })

      -- Toggle keymap (works for all buffers)
      vim.keymap.set("n", "<leader>th", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
      end, { desc = "Toggle inlay hints" })
    end
  },
  {
    vim.diagnostic.config({
      virtual_text = {
        prefix = "❗",
        spacing = 2,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  },
}
