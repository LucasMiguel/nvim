return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest",
  config = function()
    require("mcphub").setup({
      port = 37373,
      config = vim.fn.expand("~/.config/mcp/servers.json"),
      cmd = "/home/lucasmiguel/.config/nvm/versions/node/v20.20.2/bin/mcp-hub",
      auto_start = true,
      log = {
        level = vim.log.levels.WARN,
        to_file = false,
      },
      extensions = {
        codecompanion = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    })
  end,
}

