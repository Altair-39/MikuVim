return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      -- Configure `null-ls` for LaTeX formatting
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.latexindent.with({
            filetypes = { "tex" },  -- Only apply to .tex files
            command = "latexindent", -- Use latexindent for formatting
            args = { "-l", "-m" },   -- Optional args: -l (log), -m (modify in place)
          }),
        },
        -- Auto format on save
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
            vim.api.nvim_command [[augroup END]]
          end
        end,
      })
    end,
  }
}

