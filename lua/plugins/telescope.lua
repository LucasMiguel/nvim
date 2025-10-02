return{{
	'nvim-telescope/telescope.nvim', 
  dependencies = { 
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-fzf-native.nvim',
		'nvim-telescope/telescope-ui-select.nvim'
	},
	config = function ()
		require('telescope').setup {
          defaults = {
            file_ignore_patterns = {}, -- remova padrões se quiser que apareçam
          },
          pickers = {
            find_files = {
              hidden = true,
              find_command = {
                "rg",
                "--files",
                "--hidden",
                "--no-ignore",
                "--glob=!**/.git/*",
                "--glob=!**/.idea/*",
                "--glob=!**/.vscode/*",
                "--glob=!**/build/*",
                "--glob=!**/dist/*",
                "--glob=!**/yarn.lock",
                "--glob=!**/package-lock.json",
                "--glob=!**/node_modules/*",
                "--glob=!**/vendor/*",
              },
            },
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
		set({"v", "n"}, "<leader>ff", builtin.find_files)
		set({"v", "n"}, "<leader>ft", builtin.help_tags)
		set({"v", "n"}, "<leader>fw", builtin.live_grep)
		set({"v", "n"}, "<leader>fb", builtin.current_buffer_fuzzy_find)
		set({"v", "n"}, "<leader>fs", builtin.grep_string)
        set({"v", "n"}, "<leader>fo", builtin.lsp_document_symbols)
        set({"v", "n"}, "<leader>fg", builtin.git_commits)
		set({"v", "n"}, "<leader>fn", function ()
			builtin.find_files { cwd = vim.fn.stdpath "config" }
		end)
	end
}}
