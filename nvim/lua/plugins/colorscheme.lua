-- In your LazyVim plugin specification file (e.g., lua/plugins/colorscheme.lua)

return {
  {
    'RRethy/base16-nvim',
    -- Load this plugin on startup so the colorscheme is available immediately
    lazy = false,
    -- Alternatively, use an event like "VeryLazy"
    -- event = "VeryLazy",

    -- The config function runs AFTER the plugin is loaded
    config = function()
      -- Set the colorscheme here, now that the plugin is loaded
      vim.cmd 'silent! colorscheme base16-black-metal-gorgoroth'

      -- You can also add any other base16-nvim specific configuration here
      -- require('base16-colorscheme').setup({ ... })
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine', -- Set a name
    lazy = true,
    config = function()
      require('rose-pine').setup {
        variant = 'moon', -- "main", "moon" or "dawn"
      }
    end,
  },
  {
    'https://github.com/vague2k/vague.nvim', -- Assuming this is the correct repo
    name = 'vague', -- Set a name
    lazy = true,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin', -- Set a name for the plugin
    lazy = true,
    config = function()
      require('catppuccin').setup {
        -- your configuration, for example...
        flavour = 'frappe', -- latte, frappe, macchiato, mocha
        transparent_background = true,
        default_integrations = true,
        integrations = {
          harpoon = true,
        },
      }
      -- If Catppuccin requires an explicit load call after setup, uncomment the next line
      -- vim.cmd.colorscheme "catppuccin" -- Use this if setup() doesn't automatically load
    end,
  },
}
