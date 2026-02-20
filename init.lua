vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.termguicolors = true;

vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")
vim.opt.clipboard = "unnamedplus"

require("config.key-mapping")
require("config.lazy")
require("config.core")

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
