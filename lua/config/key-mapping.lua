---------------------------------
-- Atalhos de teclado
---------------------------------
local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "

-- mappingkey

kmap({'n', 'v'}, '<leader>q', ':q<CR>', opts)
kmap({'n', 'v'}, '<leader>s', ':w<CR>', opts)
kmap({'n', 'v'}, '<leader>,', ':BufferPrevious<CR>', opts)
kmap({'n', 'v'}, '<leader>.', ':BufferNext<CR>', opts)
kmap({'n', 'v'}, '<leader>w', ':BufferClose<CR>', opts)
kmap({'n', 'v'}, '<leader>t', ':BufferRestore<CR>', opts)
kmap({'n', 'v', 'i'}, 'qq', "<Esc>", opts)
kmap({'n', 'i'}, 'vv', "<Esc>v", opts)
kmap({'n', 'i'}, 'VV', "<Esc>V", opts)
kmap({'n', 'v'}, '<leader>yk', "yyP", opts)
kmap({'n', 'v'}, '<leader>su', ":SyncFtpUpload<CR>", opts)
kmap({'n', 'v'}, '<leader>yj', "yyp", opts)
kmap({'n', 'v'}, 'q', "<Nop>", opts)
kmap({'n', 'v'}, '<leader>tt', ":ToggleTerm<CR>", opts)
kmap({'t'}, '<ESC>', "exit<CR>", opts)
kmap({'x'}, '>', ">gv", opts)
kmap({'x'}, '<', "<gv", opts)
kmap({'n'}, '<T>', vim.diagnostic.open_float, opts)
kmap({'n'}, '[d', vim.diagnostic.goto_prev, opts)
kmap({'n'}, ']d', vim.diagnostic.goto_next, opts)
kmap({'n'}, '<C-h>', "<C-w>h", opts)
kmap({'n'}, '<C-j>', "<C-w>j", opts)
kmap({'n'}, '<C-k>', "<C-w>k", opts)
kmap({'n'}, '<C-l>', "<C-w>l", opts)
kmap({'n'}, 't', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
kmap({'n'}, 'T', '<cmd>Lspsaga show_buf_diagnostics<CR>', opts)
kmap({"n"}, "<leader>ng", function()
  require("neogen").generate()
end, { desc = "Gerar doc (neogen)" })

kmap({"n"}, "<leader>fd", ":Telescope todo-comments<CR>", opts);

-- Chat abrir
kmap("n", "<leader>cc", function()
  require("CopilotChat").toggle()
end)

-- Chat com seleção (visual mode)
kmap("v", "<leader>cc", function()
  require("CopilotChat").open({
    selection = require("CopilotChat.select").visual
  })
end)

-- Explicar código
kmap("v", "<leader>ce", function()
  require("CopilotChat").ask("Explique esse código")
end)

-- Refatorar
kmap("v", "<leader>cr", function()
  require("CopilotChat").ask("Refatore esse código melhorando legibilidade")
end)

-- Gerar código
kmap("n", "<leader>cg", function()
  require("CopilotChat").ask("Gere código para:")
end)

kmap("n", "<leader>cp", function()
  require("telescope.builtin").find_files({
    prompt_title = "Selecionar arquivo para contexto",
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local entry = require("telescope.actions.state").get_selected_entry()
        require("CopilotChat").open({
          context = { entry.path }
        })
      end)
      return true
    end
  })
end)
