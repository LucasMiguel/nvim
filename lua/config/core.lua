local set = vim.opt;
local cmd = vim.cmd;

set.number = true;
set.relativenumber= true;
set.shiftwidth = 2;
set.smarttab = true;
set.tabstop = 4;
set.clipboard = "unnamedplus"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.expandtab = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "expr"
set.hidden = true
set.inccommand = "split"
set.splitbelow = true
set.splitright = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
set.wrap = true
set.spell = true
set.spelllang = 'pt_br'

cmd.colorscheme("onedark")

cmd([[
  filetype plugin indent on
  syntax on
]])
