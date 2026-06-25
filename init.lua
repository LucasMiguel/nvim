vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.termguicolors = true;

local node20 = "/home/lucasmiguel/.config/nvm/versions/node/v20.20.2/bin"
vim.env.PATH = node20 .. ":" .. vim.env.PATH

vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")
vim.opt.clipboard = "unnamedplus"

vim.filetype.add({
  extension = {
    js = "javascript",
    jsx = "javascriptreact",
    ts = "typescript",
    tsx = "typescriptreact",
  },
})

require("config.key-mapping")
require("config.lazy")
require("config.core")

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

local orig_cmdheight = vim.opt.cmdheight:get()
vim.opt.cmdheight = 1

vim.g.copilot_enabled = true
vim.lsp.set_log_level("WARN")

-- Tipos de arquivo onde Copilot funcionará
vim.g.copilot_filetypes = {
  ["*"] = true,           -- Habilitado em todos os arquivos
  ["vim"] = false,        -- Desabilitado em arquivos Vim
  ["markdown"] = false,   -- Desabilitado em Markdown
}

-- Atualização de arquivos externos
vim.opt.autoread = true
vim.opt.updatetime = 500

local group = vim.api.nvim_create_augroup("external_file_changes", { clear = true })

vim.api.nvim_create_autocmd({
  "BufEnter",
  "CursorHold",
  "CursorHoldI",
}, {
  group = group,
  callback = function()
    vim.cmd("silent! checktime")
  end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = group,
  callback = function()
    vim.notify("Arquivo atualizado externamente", vim.log.levels.INFO)
  end,
})
