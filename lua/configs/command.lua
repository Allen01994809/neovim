local vim = vim
-- TODO: VSCode用の設定も考える

-- codeFormat
local codeFormat = function()
	vim.lsp.buf.format { async = true }
end
vim.api.nvim_create_user_command('CodeFormat', codeFormat, {})
vim.keymap.set("n", "<Space>cf", codeFormat, {})

-- codeRename
local codeRename = function()
	vim.lsp.buf.rename()
end
vim.api.nvim_create_user_command('CodeRename', codeRename, {})
vim.keymap.set("n", "<Space>cr", codeRename, {})

-- codeActionEvent
local codeActionEvent = function()
	vim.lsp.buf.code_action()
end
vim.api.nvim_create_user_command('CodeAction', codeActionEvent, {})
vim.keymap.set("n", "<Space>ca", codeActionEvent, {})

-- codeDefinition
local codeDefinition = function()
	vim.lsp.buf.definition()
end
vim.api.nvim_create_user_command('CodeDefinition', codeDefinition, {})

-- codeDeclaration
local codeDeclaration = function()
	vim.lsp.buf.declaration()
end
vim.api.nvim_create_user_command('CodeDeclaration', codeDeclaration, {})

-- codeHover
local codeHover = function()
	vim.lsp.buf.hover()
end
vim.api.nvim_create_user_command('CodeHover', codeHover, {})
vim.keymap.set("n", "<Space>ch", codeHover, {})

