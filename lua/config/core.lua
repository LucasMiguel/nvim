local set = vim.opt;
local cmd = vim.cmd;

set.number = true
-- set.relativenumber= true
set.shiftwidth = 2
set.smarttab = true
set.tabstop = 4
set.clipboard = "unnamedplus"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.expandtab = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldlevel = 99
set.foldlevelstart = 99
set.foldmethod = "expr"
set.foldtext = "v:lua.require'foldtext'.foldtext()"
set.foldenable = true
set.foldcolumn = "3"
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
set.termguicolors = true

-- cmd.colorscheme("catppuccin")
cmd.colorscheme("onedark")
-- cmd.colorscheme("atomic")
-- cmd.colorscheme("andromeda")
-- cmd.colorscheme("suspect")


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

cmd([[
  filetype plugin indent on
  syntax on
]])

vim.opt.diffopt:append({
  "algorithm:histogram",
  "indent-heuristic",
  "linematch:60",
})

vim.cmd([[
  highlight DiffAdd guibg=#26332c
  highlight DiffDelete guibg=#3a2626
  highlight DiffChange guibg=#2c2c3a
  highlight DiffText guibg=#3a3a5a
]])

vim.opt.fillchars = {
  foldopen = "",   -- aberto
  foldclose = "",  -- fechado
  fold = " ",       -- linha sem fold
  foldsep = " ",    -- separador
}
