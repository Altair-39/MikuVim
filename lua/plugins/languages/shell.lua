local lspconfig = require "lspconfig"
local on_attach = require("plugins.lspconfig.on-attach").on_attach

lspconfig.bashls.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- Bash LSP-specific setup here
  end,
  capabilities = require("plugins.lspconfig.on-attach").capabilities,
  filetypes = { "sh", "bash", "zsh" },
}
