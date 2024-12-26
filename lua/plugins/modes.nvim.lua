-- plugin para controlar a cor do cursor nos modos de edição
return {{
	'mvllow/modes.nvim',
	tag = 'v0.2.1',
	config = function()
		require('modes').setup({
          colors = {
            bg='#e5e5e5',
            copy = "#f5c359",
            delete = "#c75c6a",
            insert = "#78ccc5",
            visual = "#9745be",
          }
        })
	end
}}
