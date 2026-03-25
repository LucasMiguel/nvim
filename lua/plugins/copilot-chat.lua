return{{
 "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("CopilotChat").setup({
      debug = false,
      model="gpt-5 mini",
    })
  end
}}
