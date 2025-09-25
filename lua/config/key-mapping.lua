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
kmap({'n'}, '<C-h>', "<C-w>h", opts)
kmap({'n'}, '<C-j>', "<C-w>j", opts)
kmap({'n'}, '<C-k>', "<C-w>k", opts)
kmap({'n'}, '<C-l>', "<C-w>l", opts)
