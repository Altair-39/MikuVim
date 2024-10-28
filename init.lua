require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

vim.wo.relativenumber = true

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end


dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- Startify configuration
vim.g.startify_custom_header = {
    '   ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ██╗',
    '   ████╗  ██║ ██╔════╝ ██╔══██╗ ██║   ██║ ██║ ██║',
    '   ██╔██╗ ██║ █████╗   ██████╔╝ ██║   ██║ ██║ ██║',
    '   ██║╚██╗██║ ██╔══╝   ██╔══██╗ ██║   ██║ ╚═╝ ╚═╝',
    '   ██║ ╚████║ ███████╗ ██║  ██║ ╚██████╔╝ ██╗ ██╗',
    '   ╚═╝  ╚═══╝ ╚══════╝ ╚═╝  ╚═╝  ╚═════╝  ╚═╝ ╚═╝',
}
vim.g.startify_lists = {
    { type = 'files', header = { '   MRU ' } },
    { type = 'bookmarks', header = { '   Bookmarks ' } },
}
vim.g.startify_update_oldfiles = 7
vim.g.startify_change_to_dir = 1
vim.g.startify_session_autoload = 1
vim.g.startify_session_dir = '~/.config/nvim/session'

