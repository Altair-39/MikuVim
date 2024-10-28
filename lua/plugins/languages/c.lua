local lspconfig = require "lspconfig"
local formatting = require("plugins.lspconfig.formatting")
local on_attach = require("plugins.lspconfig.on-attach").on_attach
local capabilities = require("plugins.lspconfig.on-attach").capabilities

lspconfig.clangd.setup {
  on_attach = formatting.on_attach_with_formatting,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" },
  settings = {
    clangd = {
      fallbackFlags = { "-std=c++17" },
    },
  },
}

