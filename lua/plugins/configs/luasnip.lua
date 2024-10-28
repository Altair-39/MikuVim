return {
  -- Friendly Snippets
  { 'rafamadriz/friendly-snippets' },

  -- LuaSnip
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',                             -- Load on entering insert mode
    dependencies = { 'rafamadriz/friendly-snippets' }, -- Load friendly-snippets first
    build = "make install_jsregexp",                   -- Install jsregexp for LuaSnip
    config = function()
      local luasnip = require('luasnip')

      -- Lazy-load VSCode snippets from friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()


      -- Load custom snippets from a Lua file
      local custom_snippet_path = vim.fn.expand("~/.config/nvim/lua/plugins/LaTeX/snip.lua")
      require('luasnip.loaders.from_lua').load({ paths = custom_snippet_path })


      -- Debugging: Print snippets to verify if custom snippets loaded correctly
      vim.schedule(function() -- Ensuring it prints after snippets are loaded

      end)

      -- Optional: Set up key mappings for expanding or jumping in snippets
      vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua require'luasnip'.expand_or_jump()<CR>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("s", "<C-k>", "<cmd>lua require'luasnip'.jump(1)<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("s", "<C-j>", "<cmd>lua require'luasnip'.jump(-1)<CR>", { noremap = true, silent = true })

      -- Optional: Setting up snippet editing
      vim.api.nvim_set_keymap("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/LaTeX/snip.lua<CR>",
        { noremap = true, silent = true })
    end
  },
}
