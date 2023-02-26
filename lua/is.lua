local is = {}
local jit = jit;

is.windows = jit.os == 'Windows'
is.mac = jit.os == 'OSX'
is.linux = jit.os == 'Linux'

is.vscode = vim.g.vscode

return is
