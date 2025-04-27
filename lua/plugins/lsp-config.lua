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
        ensure_installed = { "lua_ls", "ts_ls", "clangd", "pyright", "tailwindcss", "cssls", "html" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", opts = {}},
    },


    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)

          local opts = { buffer = ev.buf, silent = true }

          -- set keymaps
          local current_bufnr = vim.api.nvim_get_current_buf()
          vim.lsp.inlay_hint.enable(true, { bufnr = current_bufnr })
          -- Common keymaps for all LSPs
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = current_bufnr })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = current_bufnr })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer =current_bufnr })
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = current_bufnr })
        end
      })

      -- Global on_attach for all LSP servers
      local on_attach = function()
        local current_bufnr = vim.api.nvim_get_current_buf()
        vim.lsp.inlay_hint.enable(true, { bufnr = current_bufnr })
        -- Common keymaps for all LSPs
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = current_bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = current_bufnr })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer =current_bufnr })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = current_bufnr })
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
        format = function(diagnostic)
          -- Format and wrap the diagnostic message
          local message = diagnostic.message
          local width = vim.o.columns - 40  -- Leave some margin

          -- Simple word wrapping function
          local wrapped_message = ""
          local current_line = ""

          for word in message:gmatch("%S+") do
            if #current_line + #word + 1 > width then
              wrapped_message = wrapped_message .. current_line .. "\n"
              current_line = word .. " "
            else
              current_line = current_line .. word .. " "
            end
          end

          wrapped_message = wrapped_message .. current_line
          return wrapped_message
        end,
      },
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        -- Enable wrapping in the floating window
        width = math.min(vim.o.columns - 4, 80),
        wrap = true,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  },
  vim.keymap.set('n', '<leader>d', function()
    vim.diagnostic.open_float({
      border = "rounded",
      width = math.min(vim.o.columns - 4, 80),
      wrap = true,
      source = "always",
    })
  end, { desc = "Show diagnostics in floating window" })

}
