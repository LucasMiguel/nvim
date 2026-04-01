return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "angularls",
          "html",
          "cssls",
          "jsonls",
          "intelephense", -- PHP
        },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      -- ========================
      -- TS / JS
      -- ========================
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "/home/lucasmiguel/.config/nvm/versions/node/v24.14.1/bin/node",
          vim.fn.stdpath("data")
            .. "/mason/packages/typescript-language-server/node_modules/typescript-language-server/lib/cli.mjs",
          "--stdio",
        },
      })

      -- ========================
      -- Angular
      -- ========================
      vim.lsp.config("angularls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- ========================
      -- HTML
      -- ========================
      vim.lsp.config("html", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- ========================
      -- CSS
      -- ========================
      vim.lsp.config("cssls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- ========================
      -- JSON
      -- ========================
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- ========================
      -- PHP (Laravel)
      -- ========================
      vim.lsp.config("intelephense", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          intelephense = {
            telemetry = { enabled = false },
            environment = {
              includePaths = {
                "vendor/laravel/framework/src",
                "vendor"
              }
            },
            files = {
              maxSize = 5000000,
            }
          }
        }
      })

      vim.lsp.enable("intelephense")

      -- 🔥 Habilitar TODOS (obrigatório no 0.11)
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("angularls")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("intelephense")
    end,
  },
}
