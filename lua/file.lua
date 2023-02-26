local io = require 'io'
local file = {}

file.open = function(name)
	local f = io.open(name, 'r')

	for line in f:lines() do
		print(line);
	end
	f:close()
end

file.open('README.md')

return file
