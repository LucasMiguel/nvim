return {
{
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  config = function()

    ------------------------------------------------------------------
    -- Mason Setup
    ------------------------------------------------------------------
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "intelephense",
        "sqlls",
        "cssls",
        "html",
        "emmet_ls",
      },
    })

    ------------------------------------------------------------------
    -- LSP Capabilities
    ------------------------------------------------------------------
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    ------------------------------------------------------------------
    -- Keymaps on Attach
    ------------------------------------------------------------------
    local on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    end

    ------------------------------------------------------------------
    -- Servers Configuration
    ------------------------------------------------------------------
    local servers = {

      ----------------------------------------------------------------
      -- Lua (Neovim config)
      ----------------------------------------------------------------
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },

      ----------------------------------------------------------------
      -- JavaScript / TypeScript
      -- (AngularJS, React, jQuery)
      ----------------------------------------------------------------
      vtsls = {
        settings = {
          javascript = {
            suggest = {
              autoImports = true,
            },
          },
          typescript = {
            suggest = {
              autoImports = true,
            },
          },
        },
      },

      ----------------------------------------------------------------
      -- PHP
      ----------------------------------------------------------------
      intelephense = {
        settings = {
          intelephense = {
            files = {
              maxSize = 5000000,
            },
          },
        },
      },

      ----------------------------------------------------------------
      -- SQL
      ----------------------------------------------------------------
      sqlls = {},

      ----------------------------------------------------------------
      -- CSS
      ----------------------------------------------------------------
      cssls = {},

      ----------------------------------------------------------------
      -- HTML (AngularJS templates)
      ----------------------------------------------------------------
      html = {},

      ----------------------------------------------------------------
      -- Emmet (React / HTML produtividade)
      ----------------------------------------------------------------
      emmet_ls = {
        filetypes = {
          "html",
          "css",
          "javascript",
          "javascriptreact",
          "typescriptreact",
        },
      },
    }

    ------------------------------------------------------------------
    -- Register & Enable Servers
    ------------------------------------------------------------------
    for server, config in pairs(servers) do
      vim.lsp.config(server, vim.tbl_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, config))

      vim.lsp.enable(server)
    end

  end,
}
}
