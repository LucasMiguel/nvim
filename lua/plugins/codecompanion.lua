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
                return "Você é um assistente de perguntas e respostas para ajudar os usuários a obter informações sobre o código. Responda às perguntas dos usuários com base no contexto do código e forneça explicações claras e concisas."
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
                return "Você é um assistente de planejamento para ajudar os usuários a criar planos de implementação para tarefas de codificação. Analise a tarefa fornecida e o contexto do código para gerar um plano passo a passo que os usuários possam seguir para implementar a solução. Crie um arquivo com a extensão .md na pasta .github/plans/ativo, caso não tenha crie a pasta, e insira o plano gerado lá. O nome do arquivo deve ser o nome da tarefa com a extensão .md. Por exemplo, se a tarefa for 'Implementar função de ordenação', o arquivo deve ser '.github/plans/ativo/implementar-funcao-de-ordenacao.md'."
              end,
              tools = {"ask_questions", "file_search", "get_changed_files", "get_diagnostics", "read_file", "create_file", "insert_edit_into_file", "grep_search", "run_command"},
            },
            ['implement'] = {
              description = "Agente para implementação",
              system_prompt = function(group, ctx)
                return "Você é um assistente de implementação para ajudar os usuários a implementar soluções para tarefas de codificação. Analise a tarefa fornecida e o contexto do código para gerar uma implementação que os usuários possam seguir para resolver o problema. Insira a implementação diretamente nos arquivos de código relevantes, fazendo as edições necessárias para integrar a solução ao código existente. Seguindo o plano anexado como contexto."
              end,
              tools = {"ask_questions", "file_search", "get_changed_files", "get_diagnostics", "read_file", "create_file", "insert_edit_into_file", "grep_search", "run_command"},
            },
            ['change'] = {
              description = "Agente alterações no código",
              system_prompt = function(group, ctx)
                return "Você é um assistente de alterações de código para ajudar os usuários a fazer alterações específicas no código. Analise a tarefa fornecida e o contexto do código para gerar as alterações necessárias que os usuários possam seguir para modificar o código existente. Insira as alterações diretamente nos arquivos de código relevantes, fazendo as edições necessárias para integrar as mudanças ao código existente."
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
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
    require("config.extensions.fidget-spinner"):init()
    require("config.extensions.lualine"):init()
  end,
}}
