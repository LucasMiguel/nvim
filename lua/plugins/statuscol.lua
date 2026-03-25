return{{
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")

    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { " " } }, -- espaço entre fold e número
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { text = { "  " } }, -- 👈 padding aqui (2 espaços)
      },
    })
  end,
}}
