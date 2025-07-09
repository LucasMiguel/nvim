return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function(_, opts)
      require("barbar").setup({
        animation = true,
        highlight_visible = true,
        sidebar_filetypes = {
          ['neo-tree'] = {
            text = "Projeto",
            align = "center",
            event = 'BufWipeout'
          },
        },
        colors = {
           background = "#1e222a", -- Cor de fundo
           foreground = "#aeb0b8", -- Cor da fonte
           inactive_background = "#333333", -- Cor de fundo para buffers inativos
           inactive_foreground = "#9c0b0b", -- Cor da fonte para buffers inativos
        }
      })

      end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  }
}
