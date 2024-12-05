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

		local lspconfig = require('lspconfig');
		local capabilities = require("cmp_nvim_lsp").default_capabilities();

	 	local on_attach = function()
			local bufopts = {noremap=true, silent=true, buffer=bufnr}
			vim.keymap.set({'v','n'}, 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set({'v', 'n'}, 'gr', vim.lsp.buf.references, bufopts)
		end;
		
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
			    lwc_ls = {},
			    -- stimulus_ls = {},
			    templ = {},
			    eslint = {},
			    glint = {},
			    ts_ls = {},
			    vtsls = {},
			    biome = {},
			    jsonls = {},
			    grammarly = {},
			    intelephense = {},
			    -- phpactor = {},
			    sqlls = {},
          vimls = {},
		}

		for server, config in pairs(servers) do
			lspconfig[server].setup(vim.tbl_extend("force", {
				capabilities = capabilities,
				on_attach = on_attach,
			}, config))
		end
	end,

}}
