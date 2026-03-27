return{{
 "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  build = "make tiktoken",
  config = function()
    local function load_instructions()
      local path = vim.fn.getcwd() .. ".github-copilot/copilot-instructions.md"
      if vim.fn.filereadable(path) == 1 then
        return table.concat(vim.fn.readfile(path), "\n")
      end
      return ""
    end
    require("CopilotChat").setup({
      debug = false,
      model="gpt-5-mini",
      auto_insert_mode = true,
      picker = "telescope",
      context = {
        "Sempre responda em português.",
        load_instructions(),
      },
    })
  end
}}
