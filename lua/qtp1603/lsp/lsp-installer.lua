local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  -- Setting up in handler.lua
	local opts = {
		on_attach = require("qtp1603.lsp.handlers").on_attach,
		capabilities = require("qtp1603.lsp.handlers").capabilities,
	}
    
   -- vim.tbl_deep_extend means Merging 2 or more map-like tables
   if server.name == "ccls" then 
     local ccls_opts = require("qtp1603.lsp.settings.ccls")
     opts = vim.tbl_deep_extend("force", ccls_opts, opts) 
   end

   if server.name == "pyright" then 
     local pyright_opts = require("qtp1603.lsp.settings.pyright")
     opts = vim.tbl_deep_extend("force", pyright_opts, opts)
   end

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("qtp1603.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("qtp1603.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
