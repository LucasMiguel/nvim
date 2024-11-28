return {{
	"hrsh7th/nvim-cmp",
	lazy = false,
	priority = 100,
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp"},
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		vim.opt.completeopt = { "menu", "menuone", "noselect"}
		vim.opt.shortmess:append "c"

		local lspkind = require "lspkind"
		lspkind.init {}

		local cmp = require "cmp"
		
		cmp.setup {
			sources = {
				{name = "nvim_lsp"},
				{name = "cody"},
				{name = "path"},
				{name = "buffer"},
				{name = "luasnip"},
			},
			mapping = {
				["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert},
				["<S-Tab>"] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert},
        ['<C-Space>'] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping(
					cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = true
					},
					{"i", "c"}
				),
			},
			snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
			},
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = {
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = '...',  
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
         before = function (entry, vim_item)
            return vim_item
          end
        })
      }
		}
	end,
}}
