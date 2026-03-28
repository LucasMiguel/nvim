return{{
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('render-markdown').setup {
      file_types = { 'markdown', 'codecompanion', '*' }, -- Tipos de arquivo para renderizar
      render_code_blocks = true,
      render_links = true,
    }
  end,
}}
