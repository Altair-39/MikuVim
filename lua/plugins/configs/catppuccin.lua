return {
    -- other plugins...

    -- Catppuccin theme
    {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- Change to your preferred flavor
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    functions = { "bold" },
                    keywords = { "italic" },
                    strings = { "NONE" },
                    variables = { "NONE" },
                    numbers = { "NONE" },
                    booleans = { "NONE" },
                    properties = { "NONE" },
                    types = { "NONE" },
                    operators = { "NONE" },
                },
                -- Customize colors for a more blue-ish theme
                custom = {
                    base = "#1E1E2E", -- Background color
                    mantle = "#2A2A36", -- Slightly darker background
                    crust = "#3A3A4D", -- Even darker background
                    text = "#D9E0EE", -- Main text color
                    subtext1 = "#C3C4D3", -- Subtext color
                    subtext2 = "#A6A8B7", -- Lighter subtext
                    overlay2 = "#A6C2E3", -- Overlay color for UI elements
                    overlay1 = "#B7D8E8", -- Lighter overlay
                    overlay0 = "#B7D8E8", -- Even lighter overlay
                    surface0 = "#D0D0E6", -- Surface color for UI elements
                    surface1 = "#D7D7E9", -- Lighter surface color
                    surface2 = "#E3E3EF", -- Lighter still surface color

                    -- Modify blue hues to be more vibrant
                    blue = "#5E7BFD",   -- Bright blue
                    blue2 = "#1E90FF",  -- Vivid blue
                    blue3 = "#00BFFF",  -- Deep sky blue for contrast
                    blue4 = "#1C6DD0",  -- Medium blue
                    teal = "#008080",    -- Teal color
                },
            })
            -- Set the colorscheme
            vim.cmd("colorscheme catppuccin")
        end
    },
}

