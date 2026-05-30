local agents = require("config.agents")

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
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4.6",
        },
        roles = {
          user = "Miguel"
        },
        model = "Claude Sonnet 4.6",
        tools = {
          groups = {
            ['ask'] = {
              description = "Agente para perguntas e respostas",
              system_prompt = function(group, ctx)
                return agents.load("ask")
              end,
              tools = {"ask_questions", "file_search", "get_changed_files", "get_diagnostics", "read_file", "grep_search", "web_search"},
              opts = {
                collapse_tools = true,
                ignore_system_prompt = true, -- Remove the chat's default system prompt
                ignore_tool_system_prompt = true, -- Remove the default tool system prompt
              },
            },
            ['plan'] = {
              description = "Agente para gerar planos para implementações",
              system_prompt = function(group, ctx)
                return agents.load("plan")
              end,
              tools = {"ask_questions", "file_search", "get_changed_files", "get_diagnostics", "read_file", "create_file", "insert_edit_into_file", "grep_search", "run_command"},
            },
            ['implement'] = {
              description = "Agente para implementação",
              system_prompt = function(group, ctx)
                return agents.load("implement")
              end,
              tools = {"ask_questions", "file_search", "get_changed_files", "get_diagnostics", "read_file", "create_file", "insert_edit_into_file", "grep_search", "run_command"},
            },
            ['change'] = {
              description = "Agente alterações no código",
              system_prompt = function(group, ctx)
                return agents.load("change")
              end,
              tools = {"ask_questions", "file_search", "get_changed_files", "get_diagnostics", "read_file", "create_file", "insert_edit_into_file", "grep_search", "run_command"},
            },
            ['dommus_jira'] = {
              description = "Agente com ligação com workflow do jira",
              system_prompt = function(group, ctx)
                return agents.load("dommus_jira")
              end,
              tools = {"ask_questions", "file_search", "get_changed_files", "get_diagnostics", "read_file", "create_file", "insert_edit_into_file", "grep_search", "run_command"},
            },
          },
        }
      },
      inline = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4.6",
        },
        roles = {
          user = "Miguel"
        },
        opts = {
          diff = true,
        },
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
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Mensagem aqui", -- Prompt used for interactive LLM calls
        provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
        opts = {
          show_preset_actions = true, -- Show the preset actions in the action palette?
          show_preset_prompts = true, -- Show the preset prompts in the action palette?
          title = "CodeCompanion actions", -- The title of the action palette
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
    rules = {
      default = {
        description = "Collection of common files for all projects",
        files = {
          ".clinerules",
          ".cursorrules",
          ".goosehints",
          ".rules",
          ".windsurfrules",
          "AGENT.md",
          "AGENTS.md",
          {
            path = ".github",
            files = "*.md"
          },
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
    prompt_library = {
      markdown = {
        dirs = {
          vim.fn.stdpath("config") .. "/lua/config/prompts", -- Can be relative
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
