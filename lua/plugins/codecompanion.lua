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
        icons = {
          buffer_sync_all = "󰪴 ",
          buffer_sync_diff = " ",
          chat_context = " ",
          chat_fold = " ",
          tool_pending = "  ",
          tool_in_progress = "  ",
          tool_failure = "  ",
          tool_success = "  ",
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
    rules = {
      default = {
        description = "Collection of common files for all projects",
        files = {
          ".clinerules",
          ".cursorrules",
          ".goosehints",
          ".rules",
          ".windsurfrules",
          ".github/copilot-instructions.md",
          "AGENT.md",
          "AGENTS.md",
        },
        is_preset = true,
      },
      opts = {
        chat = {
          autoload = "default", -- The rule groups to load
          enabled = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
    require("config.extensions.fidget-spinner"):init()
    require("config.extensions.lualine"):init()
  end,
}}
