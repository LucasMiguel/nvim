return{{
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim"
  },
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      chat = {
        window = {
          layout = "vertical", -- estilo VSCode
          width = 0.4,
        },
      },
      cli = {
        window = {
          layout = "vertical",
          width = 0.4,
          height = 0.6,
          opts = {
            list = false,
          },
        },
      },
    },
    interactions = {
      cli = {
        agent = "copilot", -- nome do agente CLI
        agents = {
          copilot = { -- nome do agente deve ser 'copilot'
            cmd = "copilot-cli", -- comando do seu cli
            args = {},
            description = "Copilot CLI",
            provider = "terminal",
          },
        },
      },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4o", -- depende do que o Copilot liberar
            },
          },
        })
      end,
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
    require("config.extensions.fidget-spinner"):init()
    require("config.extensions.lualine"):init()
  end,
}}
