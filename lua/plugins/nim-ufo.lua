return{{
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter"
  },
  event = "VeryLazy",
  config = function()
    -- Folding base (obrigatório)
    vim.o.foldcolumn = "1" -- coluna lateral
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Keymaps recomendados
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

    -- Preview do fold (igual VSCode)
    vim.keymap.set("n", "K", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end)

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
    })
  end
}}
