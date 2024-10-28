local lspconfig = require "lspconfig"
local on_attach = require("plugins.lspconfig.on-attach").on_attach
local capabilities = require("plugins.lspconfig.on-attach").capabilities

lspconfig.lua_ls.setup {
  on_attach = function(client, bufnr)
    -- Call the original on_attach function, if defined
    if on_attach then
      on_attach(client, bufnr)
    end

    -- Enable autoformat on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      format = {
        enable = true, -- Make sure formatting is enabled
      },
    },
  },
}

