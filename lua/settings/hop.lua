local util = require 'utils'

if util.isModuleAvailable 'hop' then
	local hop = require('hop')
	local directions = require('hop.hint').HintDirection

	hop.setup({
		keys = 'etovxqpdygfblzhckisuran'
	})

	vim.keymap.set('', 'f', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
	end, { remap = true })

	vim.keymap.set('', 'F', '<cmd>HopLine<cr>', { remap = true })
	vim.keymap.set('', '<C-w>', '<cmd>HopWord<cr>', { remap = true })
end
