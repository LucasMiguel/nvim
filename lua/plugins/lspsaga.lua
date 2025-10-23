return {{
  'nvimdev/lspsaga.nvim',
  config = function()
      local function escape_winbar(str)
          if not str then return "" end
          -- Substitui os caracteres ilegais por alternativas seguras
          return str:gsub("[%$<>]", function(c)
              if c == "$" then return "＄"  -- símbolo seguro
              elseif c == "<" then return "〈"
              elseif c == ">" then return "〉"
              end
          end)
      end
      require('lspsaga').setup({
        symbol_in_winbar = {
            enable = false,
            separator = " > ",
            show_file = true,
            formatter = function(symbol)
                if symbol.name then
                    symbol.name = escape_winbar(symbol.name)
                end
                return symbol
            end,
        },
      })
  end,
  dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
  }
}}
