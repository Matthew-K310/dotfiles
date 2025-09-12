return {
  -- pyywal
  {
    'Matthew-K310/pywal16.nvim',
    config = function()
      vim.cmd.colorscheme 'pywal16'
    end,
  },
  -- Nord
  {
    'shaunsingh/nord.nvim',
    transparent_background = false,
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
        transparent_background = false,
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
    transparent_background = false,
  },
  -- Rose-pine
  {
    'rose-pine/neovim',
    name = 'rose-pine', -- Set a name
    lazy = true,
    config = function()
      require('rose-pine').setup {
        variant = 'moon', -- "main", "moon" or "dawn"
        transparent_background = false,
      }
    end,
  },
  -- Vague
  {
    'https://github.com/vague2k/vague.nvim', -- Assuming this is the correct repo
    name = 'vague', -- Set a name
    lazy = true,
    transparent_background = false,
  },
}
