local vim = vim
local is = require 'is'

vim.cmd [[
autocmd BufNewFile,BufRead	*.vue set filetype=vue
autocmd BufNewFile,BufRead	*.vert,*.vart,*.frag set filetype=glsl
autocmd BufWritePre		* :%s/\s\+$//ge  " 末尾スペースを削除
]]

if is.windows then vim.g.python3_host_prog = 'C:\\develop\\python' end
