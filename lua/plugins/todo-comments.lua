-- Plugin para rastreio de TODO
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "v1.4.0",
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup()
    end,
  }
}
