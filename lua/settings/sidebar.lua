local util = require 'utils'

-- https://github.com/sidebar-nvim/sidebar.nvim/blob/main/doc/general.md#options
if util.isModuleAvailable 'sidebar-nvim' then
	local sidebar = require("sidebar-nvim")
	sidebar.setup({
		open = true,
		-- sections = {"datetime", "git", "diagnostics"},
		sections = {"files", "git", "todos"},
		todos = {
			icon = "",
			ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
			initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
		},
		initial_width = 30,
		files = {
			icon = "",
			show_hidden = true,
			ignored_paths = {"%.git$"}
		}

	})
end
