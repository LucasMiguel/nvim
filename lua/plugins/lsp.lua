return {{	
	"williamboman/mason.nvim",
	dependencies = {	
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- Require Mason
		require("mason").setup({
		    ui = {
			icons = {
			    package_installed = "✓",
			    package_pending = "➜",
			    package_uninstalled = "✗"
			}
		    }
		});	

		-- Require Mason LSP COnfig
		require("mason-lspconfig").setup({
        automatic_installation = true,
		    ensure_installed = { 
			    "lua_ls", 
			    "rust_analyzer",
			    "angularls",
			    "bashls",
          "ast_grep",
			    "clangd",
			    "css_variables",
			    "cssls",
			    "cssmodules_ls",
			    "unocss",
			    -- "tailwindcss",
			    "docker_compose_language_service",
			    "dockerls",
			    "html",
			    "lwc_ls",
			    -- "stimulus_ls",
			    "templ",
			    "eslint",
			    "glint",
			    "ts_ls",
			    "vtsls",
			    "biome",
			    "jsonls",
			    "grammarly",
			    "intelephense",
			    -- "phpactor",
			    "sqlls",
			    "vimls",
		    },
		});

		local capabilities = require("cmp_nvim_lsp").default_capabilities();
        local node_path = "$HOME/.config/nvm/versions/node/v24.13.1/bin/node"

	 	local on_attach = function(_, bufnr)
          local bufopts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set({'v','n'}, 'gd', vim.lsp.buf.definition, bufopts)
          vim.keymap.set({'v','n'}, 'gr', vim.lsp.buf.references, bufopts)
        end
		
		local servers = {
			    lua_ls = {
              settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace"
                }
              }
            }
          },
          rust_analyzer = {},
			    angularls = {},
			    bashls = {},
                ast_grep = {},
			    clangd = {},
                css_variables= {},
			    cssls = {},
			    cssmodules_ls = {},
			    unocss = {},
			    -- tailwindcss = {},
			    docker_compose_language_service = {},
			    dockerls = {},
			    html = {},
			    lwc_ls = {
                  cmd = {
                    node_path,
                    vim.fn.stdpath("data") .. "/mason/packages/lwc-language-server/node_modules/@salesforce/lwc-language-server/bin/lwc-language-server",
                    "--stdio"
                  }
                },
                -- stimulus_ls = {},
			    templ = {},
			    eslint = {},
			    glint = {},
			    ts_ls = {
                  cmd = {
                    node_path,
                    vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript-language-server/lib/cli.mjs",
                    "--stdio"
                  }
                },
			    vtsls = {
                  cmd = {
                    node_path,
                    vim.fn.stdpath("data") .. "/mason/packages/vtsls/node_modules/@vtsls/language-server/dist/main.js",
                    "--stdio"
                  }
                },
			    biome = {},
			    jsonls = {},
			    grammarly = {},
			    intelephense = {},
			    -- phpactor = {},
			    sqlls = {},
                vimls = {},
		}

		for server, config in pairs(servers) do
          vim.lsp.config(server, vim.tbl_extend("force", {
            capabilities = capabilities,
            on_attach = on_attach,
          }, config))

          vim.lsp.enable(server)
        end
	end,

}}
