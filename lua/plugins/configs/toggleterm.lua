return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        require("toggleterm").setup({
            direction = "float", -- Use floating terminal
            float_opts = {
                border = "double", -- Double border
            },
        })

        -- Key mappings
        vim.api.nvim_set_keymap("n", "<Leader>tt", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })
    end,
}
