local lspconfig = require "lspconfig"
local on_attach = require("plugins.lspconfig.on-attach").on_attach
local capabilities = require("plugins.lspconfig.on-attach").capabilities

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
