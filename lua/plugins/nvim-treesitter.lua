local ensure_installed = {
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

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()

		local installed = require("nvim-treesitter.config").get_installed("parsers")
		local missing = vim.tbl_filter(function(lang)
			return not vim.tbl_contains(installed, lang)
		end, ensure_installed)
		if #missing > 0 then
			require("nvim-treesitter").install(missing)
		end

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(args.match) or args.match
				if not vim.tbl_contains(require("nvim-treesitter.config").get_installed("parsers"), lang) then
					return
				end
				vim.treesitter.start(args.buf, lang)
				vim.bo[args.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
			end,
		})
	end,
}
