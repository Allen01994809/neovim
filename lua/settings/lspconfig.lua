local util = require 'utils'

if util.isModuleAvailable 'lspconfig' then
	require 'lspconfig'.lua_ls.setup {
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' },
				},
			},
		},
	}
end
