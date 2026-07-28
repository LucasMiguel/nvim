return {{
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
    lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
          ensure_installed = {
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
          },
          sync_install = false,
          auto_install = true,
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
        })
	end,
}}
