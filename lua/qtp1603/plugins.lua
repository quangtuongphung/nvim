-- Plugin Installation with Packer

	local fn = vim.fn 

	-- Automatically install Packer
	-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
	-- if fn.empty(fn.glob(install_path)) > 0 then
	--  PACKER_BOOTSTRAP = fn.system {
	--    "git",
	--    "clone",
	--    "--depth",
	--    "1",
	--    "https://github.com/wbthomason/packer.nvim",
	--    install_path,
	--  }
	--  print "Installing packer close and reopen Neovim..."
	--  vim.cmd [[packadd packer.nvim]]
	-- end
	-- Autocommand that reloads neovim whenever you save the plugins.lua file
	vim.cmd [[
	  augroup packer_user_config
	    autocmd!
	    autocmd BufWritePost plugins.lua source <afile> | PackerSync
	  augroup end
	]]

	-- Use a protected call -> Not error out when not dectecting
	local status_ok, packer = pcall(require, "packer")
	if not status_ok then
	  printf(" Didn't detect Packer" )
	  return
	end

	-- Have packer use a popup window
	packer.init {
	  display = {
	    open_fn = function()
	      return require("packer.util").float { border = "rounded" }
	    end,
	  },
	}

	-- Install Plugins with Packer
	return require('packer').startup(function()
  -- Basic Plugins
		use 'wbthomason/packer.nvim'
		use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
		use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  	use "numToStr/Comment.nvim" -- Easily comment stuff

    use "ahmedkhalf/project.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "moll/vim-bbye"                                 -- Ends Buffers
    use "lewis6991/impatient.nvim"
    use "rcarriga/nvim-notify"                          --Notification Manager
    use "kevinhwang91/nvim-bqf"
  --
    use {
          'goolord/alpha-nvim',
          config = function ()
              require'alpha'.setup(require'alpha.themes.dashboard'.config)
          end
     }

    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
  --
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

		-- Colorschemes
		use 'folke/tokyonight.nvim'

    -- Nvim tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
    }

		 -- cmp plugins
		use "hrsh7th/nvim-cmp" -- The completion plugin
		use "hrsh7th/cmp-buffer" -- buffer completions
		use "hrsh7th/cmp-path" -- path completions
		use "hrsh7th/cmp-cmdline" -- cmdline completions
		use "saadparwaiz1/cmp_luasnip" -- snippet completions
		use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"
    use {
      "tzachar/cmp-tabnine",
      config = function()
        local tabnine = require "cmp_tabnine.config"
        tabnine:setup {
          max_lines = 1000,
          max_num_results = 20,
          sort = true,
        }
      end,

      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
    }

		-- snippets
		use "L3MON4D3/LuaSnip" --snippet engine
		use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

		  -- LSP
		use "neovim/nvim-lspconfig" -- enable LSP
		use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "filipdutescu/renamer.nvim"
    use "simrat39/symbols-outline.nvim"
    use "ray-x/lsp_signature.nvim"
    use "b0o/SchemaStore.nvim"
    use {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    }
    use "RRethy/vim-illuminate"

      -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "tom-anders/telescope-vim-bookmarks.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "tree-sitter/tree-sitter-cpp"
    use "nvim-treesitter/playground"
    use "romgrk/nvim-treesitter-context"

        -- Git
    use "lewis6991/gitsigns.nvim"

  if PACKER_BOOTSTRAP then 
      require("packer").sync()
    end
  end)
