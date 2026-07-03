return{{
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = { 
      preset = 'default',
      ["<Tab>"] = {
        "select_next",
        "fallback"
      },
      ["<S-Tab>"] = {
        "select_prev",
        "fallback"
      },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-space>"] = { "show", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'minuet' },
      -- For manual completion only, remove 'minuet' from default
      providers = {
        minuet = {
          name = 'minuet',
          module = 'minuet.blink',
          async = true,
          timeout_ms = 3000,
          score_offset = 50, -- Gives minuet higher priority among suggestions
        },
      },
    },
    -- completion = { documentation = { auto_show = false } },
    completion = { 
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },
      list = {
        selection = { 
          preselect = true, 
          auto_insert = false 
        }
      }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}}

