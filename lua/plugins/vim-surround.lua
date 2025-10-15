return {
  "kylechui/nvim-surround",
  version = "*", -- versão estável
  event = "VeryLazy", -- carrega só quando precisar
  config = function()
    require("nvim-surround").setup({})
  end,
}
