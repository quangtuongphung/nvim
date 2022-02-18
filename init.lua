-- Path to lua files 
--
	-- Basic Setting
	require "qtp1603.options" 	-- Options
	require "qtp1603.keymaps"	-- Keymaps
	require "qtp1603.colorscheme" 	-- Color Scheme
	-- Plugins Installation
	require "qtp1603.plugins"	-- Packer plugins management
  require "qtp1603.cmp"
  require "qtp1603.lsp"

	-- Auto Completion and Lsp Setting
  require "qtp1603.gitsigns"
  require "qtp1603.autopairs"
  require "qtp1603.treesitter"

  -- Browsing and Looking for files
  require "qtp1603.nvim-tree"
  require "qtp1603.telescope"

  require "qtp1603.icons"
  require "qtp1603.notify"

  require "qtp1603.alpha"
  require "qtp1603.bufferline"
  require "qtp1603.lualine"
--  require "qtp1603.whichkey"
