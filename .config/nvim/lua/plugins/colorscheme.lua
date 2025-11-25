return {
  -- Compline theme
  {
    'jblais493/compline',
    name = 'compline',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme compline'
    end,
  },
  -- Lauds theme
  {
    'jblais493/compline',
    name = 'lauds',
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme lauds'
    end,
  },
  -- Nord
  {
    'shaunsingh/nord.nvim',
    transparent_background = true,
  },
  -- Catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato',
        transparent_background = false,
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
    lazy = true,
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
