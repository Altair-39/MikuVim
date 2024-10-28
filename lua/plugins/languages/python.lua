local lspconfig = require "lspconfig"
local formatting = require("plugins.lspconfig.formatting")
local on_attach = require("plugins.lspconfig.on-attach").on_attach
local capabilities = require("plugins.lspconfig.on-attach").capabilities

lspconfig.pylsp.setup {
  on_attach = formatting.on_attach_with_formatting,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        pyflakes = { enabled = true },
        pycodestyle = { enabled = true, maxLineLength = 88 },
        pylsp_mypy = { enabled = false },
        pylsp_black = { enabled = true },
        pylsp_isort = { enabled = true },
        pylint = { enabled = false },
      },
    },
  },
}
