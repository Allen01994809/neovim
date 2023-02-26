local util = require 'utils'

if util.isModuleAvailable 'lgh' then
	require('lgh').setup({
		basedir = vim.fn.stdpath('data') .. '/githistory/',
		git_cmd = 'git',
		verbose = false,
		fix_ownership = true,
		diff = true,
		new_window = 'vnew'
	})
end
