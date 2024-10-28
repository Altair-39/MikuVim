return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      -- Snippet plugin
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      config = function(_, opts)
        require("plugins.configs.others").luasnip(opts)
      end,
    },

    -- Autopairing of (){}[] etc
    {
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- Setup cmp for autopairs
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },

    -- cmp sources plugins
    {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
  opts = function()
    -- Load additional settings for cmp
    local cmp = require "cmp"
    dofile(vim.g.base46_cache .. "cmp")

    local cmp_ui = require("core.utils").load_config().ui.cmp
    local cmp_style = cmp_ui.style

    local field_arrangement = {
      atom = { "kind", "abbr", "menu" },
      atom_colored = { "kind", "abbr", "menu" },
    }

    local formatting_style = {
      fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

      format = function(_, item)
        local icons = require "nvchad.icons.lspkind"
        local icon = (cmp_ui.icons and icons[item.kind]) or ""

        if cmp_style == "atom" or cmp_style == "atom_colored" then
          icon = " " .. icon .. " "
          item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
          item.kind = icon
        else
          icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
          item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
        end

        return item
      end,
    }

    local function border(hl_name)
      return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
      }
    end

    local options = {
      completion = {
        completeopt = "menu,menuone",
      },

      window = {
        completion = {
          side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          scrollbar = false,
        },
        documentation = {
          min_width = 10,
          max_width = 120,
          max_height = 20,
          border = "double",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          -- which directions to show the documentation window,
          -- for each of the possible autocomplete window directions,
          -- falling back to the next direction when there's not enough space
          direction_priority = {
            autocomplete_north = { "e", "w", "n", "s" },
            autocomplete_south = { "e", "w", "s", "n" },
          },
          -- Controls whether the documentation window will automatically show when selecting a completion item
          auto_show = true,
          auto_show_delay_ms = 500,
          update_delay_ms = 50,
        },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      formatting = formatting_style,

      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    }

    if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
      options.window.completion.border = border "CmpBorder"
    end

    return options
  end,
  config = function(_, opts)
    require("cmp").setup(opts)
  end,
}
