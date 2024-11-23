return {{
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	event = { "VeryLazy" },
	version = false,
	config = function()
		local opts = {}
		opts.ensure_installed = {
			"angular",
			"bash",
			"c",
			"css",
			"csv",
			"dart",
			"dockerfile",
			"html",
			"javascript",
			"json",
			"json5",
			"lua",
			"php",
			"php_only",
			"python",
			"regex",
			"scss",
			"sql",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		}
		opts.sync_install = true
		opts.auto_install = true
		opts.indent = { enable = true }
		opts.highlight = { enable = true }
		require("nvim-treesitter.configs").setup(opts)
	end,
}}
