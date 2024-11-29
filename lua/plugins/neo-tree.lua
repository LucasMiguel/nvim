return {
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      priority = 100000,
      config = function ()
        require('neo-tree').setup({
          close_if_last_window = false,
          enable_diagnostics = true,
          enable_git_status = true,
          popup_border_style = "rounded",
          sort_case_insensitive = false,
          filesystem = {
            bind_to_cwd = false,
            filtered_items = {
              hide_dotfiles = false,
              hide_gitignored = false,
            },
            hijack_netrw_behavior = "disabled"
          },
          window = { width = 30 },
          buffers = {
              leave_dirs_open = true,
              follow_current_file = {
                  enabled = true,
                  leave_dirs_open = true,
              },
              bind_to_cwd = false,
          },
        })
        local opts = {noremap = true, silent = true}

        vim.keymap.set({"n", "v"}, "<leader>e", ":Neotree focus<CR>", opts)
        vim.keymap.set({"n", "v"}, "<leader>ee", ":Neotree toggle<CR>", opts)
        vim.keymap.set({"n", "v"}, "<leader>ew", "<C-w>l", opts)
        vim.keymap.set({'n', 'v'}, "\\", ":Neotree reveal<CR>", opts)

        vim.cmd.normal(":Neotree close<CR>")
      end
  }
}
