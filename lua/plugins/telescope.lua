return{{
	'nvim-telescope/telescope.nvim', 
  dependencies = { 
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-fzf-native.nvim',
		'nvim-telescope/telescope-ui-select.nvim'
	},
	config = function ()
		require('telescope').setup {
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
          },
        }
      },
			extensions = {
				wrap_results = true,

				fzf = {},
				["ui-select"] = {
					require("telescope.themes").get_dropdown {},
				},
			}
		}

		pcall(require("telescope").load_extensions, "fzf")
		pcall(require("telescope").load_extensions, "ui-select")

		local builtin = require "telescope.builtin"
		-- mapeamento de atalhos
		local set = vim.keymap.set;
		set("n", "<leader>ff", builtin.find_files)
		set("n", "<leader>ft", builtin.help_tags)
		set("n", "<leader>fw", builtin.live_grep)
		set("n", "<leader>fb", builtin.current_buffer_fuzzy_find)
		set("n", "<leader>fs", builtin.grep_string)
    set("n", "<leader>fo", builtin.lsp_document_symbols)
    set("n", "<leader>fg", builtin.git_commits)
		set("n", "<leader>fn", function ()
			builtin.find_files { cwd = vim.fn.stdpath "config" }
		end)
	end
}}
