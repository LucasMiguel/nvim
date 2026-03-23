return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      -- Forçar o uso do Node 24.13.1
      copilot_node_command = "/home/lucasmiguel/.config/nvm/versions/node/v24.13.1/bin/node",
      
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = "<M-]>",
          accept_line = "<M-;>",
          next = "<M-Down>",
          prev = "<M-Up>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<S-CR>"
        },
        layout = {
          position = "right", -- | top | left | right | bottom |
          ratio = 0.4
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      server_opts_overrides = {},
    })
  end,
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
}
