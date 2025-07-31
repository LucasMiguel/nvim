return{{
  'akinsho/toggleterm.nvim', 
  version = "*", 
  config = function ()
    require('toggleterm').setup({
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 0,
      },
    });
  end
}}
