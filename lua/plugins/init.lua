-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local default_plugins = {

  "nvim-lua/plenary.nvim",

  require('plugins.configs.base46'),

  require('plugins.configs.mini'),

  require('plugins.configs.ui'),

  --require('plugins.configs.luasnip'),

  require('plugins.configs.latex-snippets'),

  require('plugins.configs.nvterm'),

  require('plugins.configs.nvim-colorized'),

  require('plugins.configs.nvim-web-devicons'),

  require('plugins.configs.indent-blankline'),

  require('plugins.configs.treesitter'),

  require('plugins.configs.snipe'),

  require('plugins.configs.git'),

  require('plugins.configs.mason'),

  require('plugins.configs.cmp'),

  require('plugins.configs.comment'),

  require('plugins.configs.nvimtree'),

  require('plugins.configs.tagbar'),

  require('plugins.configs.md-preview'),

  require('plugins.configs.telescope'),

  require('plugins.configs.lervag'),

  require('plugins.configs.luarocks'),

  require('plugins.configs.image'),

  require('plugins.configs.ltex'),

  require('plugins.configs.noice'),

  require('plugins.configs.which-key'),

  require('plugins.configs.markview'),

  require('plugins.configs.toggleterm'),

  require('plugins.configs.latexindent'),

  require('plugins.configs.dap'),

  require('plugins.configs.dap-ui'),

  require('plugins.configs.undotree'),

  require('plugins.configs.barbar'),

  -- language

  require('plugins.configs.matlab'),

  require('plugins.configs.lspconfig'),

  require('plugins.configs.rustaceanvim'),

  require('plugins.configs.rust'),

  require('plugins.configs.jdtls'),

}

local config = require("core.utils").load_config()
vim.opt.termguicolors = true

if #config.plugins > 0 then
  table.insert(default_plugins, { import = config.plugins })
end

require("mini.icons").setup()
require("lazy").setup(default_plugins, config.lazy_nvim)
