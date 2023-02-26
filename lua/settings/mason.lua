local util = require 'utils'

-- ref https://github.com/williamboman/mason.nvim
if util.isModuleAvailable 'mason' then
	local vim = vim
	local lspconfig = require 'lspconfig';
	require('mason').setup({
		ui = {
			icons = {
				package_installed = "v",
				package_pending = "->",
				package_uninstalled = "x"
			}
		}
	})

	if util.isModuleAvailable 'mason-lspconfig' then
		require('mason-lspconfig').setup_handlers({
			function(server)
				local opt = {
					capabilities = require('cmp_nvim_lsp').default_capabilities(
						vim.lsp.protocol.make_client_capabilities()
					)
				}

				lspconfig[server].setup(opt)
			end
		})
	end
end
