return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function(_, opts)
      require("barbar").setup(opts)

      -- -- 🎨 Definindo cores personalizadas para a aba ativa
      -- vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#ffffff", bg = "#005f87", bold = true })
      -- vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = "#ffaf00", bg = "#005f87", bold = true })
      -- vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = "#00ffaf", bg = "#005f87", bold = true })
      -- vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = "#ffffff", bg = "#005f87", bold = true })
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      highlight_visible = true,
      sidebar_filetypes = {
        ['neo-tree'] = {
          text = "Projeto",
          align = "center",
          event = 'BufWipeout'
        },
      }
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  }
}
