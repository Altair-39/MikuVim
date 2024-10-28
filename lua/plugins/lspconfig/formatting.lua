local M = {}

function M.lsp_formatting(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      local supported_clients = { "pylsp", "clangd", "rust-analyzer", "texlab" }
      for _, name in ipairs(supported_clients) do
        if client.name == name then
          return true
        end
      end
      return false
    end,
    bufnr = bufnr,
  })
end

function M.on_attach_with_formatting(client, bufnr)
  require("plugins.lspconfig.on-attach").on_attach(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
      buffer = bufnr,
      callback = function()
        M.lsp_formatting(bufnr)
      end,
    })
  end
end

return M
