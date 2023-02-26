local is = require 'is'
local util = require 'utils'

-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- git clone https://github.com/wbthomason/packer.nvim '$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim'
-- packar https://qiita.com/delphinus/items/8160d884d415d7425fcc

local function startup(use)
	-- =================================================================================
	--                                        base
	-- =================================================================================
	use {
		'wbthomason/packer.nvim',
	} -- https://github.com/wbthomason/packer.nvim

	-- =================================================================================
	--                                        utils
	-- =================================================================================
	use { 'nvim-lua/popup.nvim', disable = is.vscode }
	use { 'mattn/emmet-vim', disable = is.vscode }
	use 'skanehira/translate.vim' -- :Translate で翻訳できる
	use 'kyazdani42/nvim-web-devicons'

	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require 'hop'.setup {}
		end
	} -- easy motion

	-- =================================================================================
	--                                        git
	-- =================================================================================
	use { 'tpope/vim-fugitive', disable = is.vscode } -- https://github.com/tpope/vim-fugitive
	use { 'tpope/vim-rhubarb', disable = is.vscode } -- https://qiita.com/takayama/items/de4341fb8f015ffe4750#tpopevim-rhubarb
	use { 'kdheepak/lazygit.nvim', disable = is.vscode }
	-- use { 'APZelos/blamer.nvim', disable = is.vscode }

	-- =================================================================================
	--                                        lsp
	-- =================================================================================
	use { 'neovim/nvim-lspconfig', disable = is.vscode }
	use { 'williamboman/mason.nvim', disable = is.vscode }
	use { 'williamboman/mason-lspconfig.nvim', disable = is.vscode }

	-- =================================================================================
	--                                        cmp plugins
	-- =================================================================================
	use { 'hrsh7th/nvim-cmp', disable = is.vscode } -- The completion plugin
	use { 'hrsh7th/cmp-buffer', disable = is.vscode } -- buffer completions
	use { 'hrsh7th/cmp-path', disable = is.vscode } -- path completions
	use { 'hrsh7th/cmp-cmdline', disable = is.vscode } -- cmdline completions
	use { 'saadparwaiz1/cmp_luasnip', disable = is.vscode } -- snippet completions
	use {
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip").config.setup({ history = false })
		end,
	}
	use { 'hrsh7th/cmp-nvim-lsp', disable = is.vscode }
	use { 'hrsh7th/cmp-nvim-lua', disable = is.vscode }

	-- =================================================================================
	--                                        dir searcher
	-- =================================================================================
	-- use 'mileszs/ack.vim' -- https://github.com/mileszs/ack.vim https://qiita.com/Biacco/items/b750c073a92a8e9fea7d
	use {
		'ibhagwan/fzf-lua',
		requires = { 'nvim-tree/nvim-web-devicons' },
		disable = is.vscode,
	}
	use {
		'm42e/lgh.nvim',
		requires = { "ibhagwan/fzf-lua" },
		disable = is.vscode,
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		disable = is.vscode,
	} -- https://github.com/nvim-telescope/telescope.nvim#usage
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		requires = { { 'nvim-telescope/telescope.nvim' } },
		disable = is.vscode,
	}

	-- =================================================================================
	--                                        sidebar
	-- =================================================================================
	use { 'sidebar-nvim/sidebar.nvim', disable = is.vscode }

	-- =================================================================================
	--                                        syntax highlight
	-- =================================================================================
	if is.mac or is.linux then
		use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }, disable = is.vscode }
		use { 'christianchiarulli/nvcode-color-schemes.vim', disable = is.vscode }
	end


	if is.windows then
		use { 'tikhomirov/vim-glsl', ft = { 'glsl' } }
		use { 'elzr/vim-jsohttps://github.com/ArakiTakaki/ArakiTakaki/blob/master/setup/mac.shn', ft = { 'json' } }
		use { 'groenewege/vim-less', ft = { 'less' } }
		use { 'stephpy/vim-yaml', ft = { 'swift' } }
		use { 'keith/swift.vim', ft = { 'yaml' } }
		use { 'digitaltoad/vim-jade', ft = { 'jade' } }
		use { 'wavded/vim-stylus', ft = { 'stylus' } }
		use { 'StanAngeloff/php.vim', ft = { 'php' } }
		use { 'kchmck/vim-coffee-script', ft = { 'coffee' } }
		use { 'dag/vim-fish', ft = { 'fish' } }
		use { 'cespare/vim-toml', ft = { 'toml' } }
		use { 'yuezk/vim-js', ft = { 'javascript', 'javascript.jsx' } }
		use { 'maxmellon/vim-jsx-pretty', ft = { 'javascript', 'javascript.jsx' } }
		use { 'peitalin/vim-jsx-typescript', ft = { 'typescript, typescript.tsx' }, requires = { 'leafgarland/typescript-vim' } }
	end
end

if util.isModuleAvailable 'packer' then require 'packer'.startup(startup) end
