return {
  -- pyywal
  {
    'uZer/pywal16.nvim',
    -- for local dev replace with:
    -- dir = '~/your/path/pywal16.nvim',
    config = function()
      vim.cmd.colorscheme 'pywal16'
    end,
  },
  -- Nord
  {
    'shaunsingh/nord.nvim',
  },
  -- Catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin', -- Set a name for the plugin
    lazy = true,
    config = function()
      require('catppuccin').setup {
        -- your configuration, for example...
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
        -- transparent_background = true,
        default_integrations = true,
        integrations = {
          harpoon = true,
        },
      }
    end,
  },
  -- Gorgoroth
  {
    'RRethy/base16-nvim',
    lazy = false,
    config = function()
      vim.cmd 'silent! colorscheme base16-black-metal-gorgoroth'
    end,
  },
  -- Rose-pine
  {
    'rose-pine/neovim',
    name = 'rose-pine', -- Set a name
    lazy = true,
    config = function()
      require('rose-pine').setup {
        variant = 'moon', -- "main", "moon" or "dawn"
        -- transparent_background = true,
      }
    end,
  },
  -- Vague
  {
    'https://github.com/vague2k/vague.nvim', -- Assuming this is the correct repo
    name = 'vague', -- Set a name
    lazy = true,
    -- transparent_background = true,
  },
}
