return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  config = function()
    -- Load additional LSP configurations
    dofile(vim.g.base46_cache .. "lsp")
    require "nvchad.lsp"

    -- Import language-specific LSP configurations
    require("plugins.languages.lua")
    require("plugins.languages.python")
    require("plugins.languages.c")
    require("plugins.languages.shell")
    require("plugins.languages.markdown")
    require("plugins.languages.tex")
    require("plugins.languages.css")
    require("plugins.languages.java")
    --    require("plugins.languages.nat-lang")
  end,
}
