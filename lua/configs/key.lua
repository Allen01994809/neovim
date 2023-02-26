local vim = vim

-- Git Commands
vim.cmd [[
nnoremap	[git]		<Nop>
nmap		<Space>g	[git]
nnoremap	<silent>	[git]s :Git status -sb<CR>
nnoremap	<silent>	[git]d :<C-u>Gdiff<CR>
nnoremap	<silent>	[git]b :Git blame<CR>
nnoremap	<silent>	[git]h :<C-u>GBrowse<CR>
nnoremap	<silent>	[git]g :LazyGit<CR>
]]

-- File Commands
vim.cmd [[
nnoremap	[file]		<Nop>
nmap		<Space>f	[file]
nnoremap	[file]s		:Ack
nnoremap	[file]i		<cmd>Telescope file_browser<cr>
nnoremap	[file]g		<cmd>Telescope live_grep<cr>
nnoremap	[file]b		<cmd>Telescope buffers<cr>
nnoremap	[file]h		<cmd>Telescope help_tags<cr>
nnoremap	[file]f		<cmd>Telescope find_files<cr>
nnoremap	<C-p>		<cmd>FzfLua<cr>
nnoremap	<C-f>		:Ack
]]

