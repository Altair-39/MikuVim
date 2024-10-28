local lspconfig = require "lspconfig"
local on_attach = require("plugins.lspconfig.on-attach").on_attach
local capabilities = require("plugins.lspconfig.on-attach").capabilities

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },  
}
