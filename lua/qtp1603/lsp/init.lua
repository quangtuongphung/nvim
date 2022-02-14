local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "qtp1603.lsp.lsp-installer"
require("qtp1603.lsp.handlers").setup()
require "qtp1603.lsp.null-ls"
