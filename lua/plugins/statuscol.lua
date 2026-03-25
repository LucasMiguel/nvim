return{{
  "luukvbaal/statuscol.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim"
  },
  config = function()
    local builtin = require("statuscol.builtin")

    local function safe_sign()
      local ok, result = pcall(builtin.signfunc)
      return ok and result or ""
    end

    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          text = { "%s" }, -- <-- ESSENCIAL: mostra signs (inclui gitsigns)
          click = "v:lua.ScSa"
        },
      },
    })
  end,
}}
