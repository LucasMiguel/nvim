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
            filtered_items = {
              hide_dotfiles = false,
              hide_gitignored = false,
            },
          },
          window = { width = 30 },
        })
        local opts = {noremap = true, silent = true}

        vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>", opts)
        vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", opts)
        vim.keymap.set("n", "<leader>ee", "<C-w>l", opts)
      end
  }
}
