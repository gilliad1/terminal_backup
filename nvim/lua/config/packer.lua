vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use "nvim-lua/plenary.nvim"
  use {
  --- LSP
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{'williamboman/mason.nvim'},           -- Optional
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},         -- Required
		{'hrsh7th/cmp-nvim-lsp'},     -- Required
		{'hrsh7th/cmp-buffer'},       -- Optional
		{'hrsh7th/cmp-path'},         -- Optional
		{'saadparwaiz1/cmp_luasnip'}, -- Optional
		{'hrsh7th/cmp-nvim-lua'},     -- Optional

		-- Snippets
		{'L3MON4D3/LuaSnip'},             -- Required
		{'rafamadriz/friendly-snippets'}, -- Optional
	}
  }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup(
	  {variant='moon'}
	)
        vim.cmd('colorscheme rose-pine')
    end
  })
  end)
