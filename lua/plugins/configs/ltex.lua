return {
  {
    'vigoux/ltex-ls.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

      -- Suppress specific LSP notifications
      vim.diagnostic.config({
        virtual_text = false,     -- Disable inline diagnostic messages
        signs = true,             -- Enable signs in the gutter for diagnostics
        underline = true,         -- Underline errors
        update_in_insert = false, -- Do not update diagnostics in insert mode
        severity_sort = true,     -- Sort diagnostics by severity
      })

      -- Function to check if we are in normal mode
      local function is_normal_mode()
        return vim.fn.mode() == 'n'
      end

      -- Function on_attach
      local function on_attach(client, bufnr)
        local opts = { noremap = true, silent = true }

        -- Mappings for diagnostics only in normal mode
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
          '<cmd>lua if is_normal_mode() then vim.diagnostic.open_float() end<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
          '<cmd>lua if is_normal_mode() then vim.diagnostic.goto_prev() end<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
          '<cmd>lua if is_normal_mode() then vim.diagnostic.goto_next() end<CR>', opts)

        -- Disable spell checking in insert mode
        vim.cmd [[
          autocmd InsertEnter <buffer> setlocal nospell
          autocmd InsertLeave <buffer> setlocal spell
        ]]
      end

      -- Configure LTeX
      lspconfig.ltex.setup {
        filetypes = { "tex", "bib" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ltex = {
            language = { "it", "en" },
            additionalRules = {
              enablePicky = false,
              motherTongue = "it",
            },
          },
        },
      }
    end,
  },
}
