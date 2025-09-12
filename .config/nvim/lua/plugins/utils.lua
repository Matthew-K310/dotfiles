return {
  { -- Autopairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function}
  },
  { -- CSS colors
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    DEFAULT_OPTIONS = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes: foreground, background
      mode = 'background', -- Set the display mode.
    },
  },
  { -- Magit for nvim
    'tpope/vim-fugitive',
  },
  { -- Lua lib utils
    'nvim-lua/plenary.nvim',
  },
  { -- Tmux navigation
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  { -- Transparency
    'xiyaowong/transparent.nvim',
    opts = {
      vim.keymap.set('n', '<leader>wt', ':TransparentToggle<CR>'),
    },
  },
  { -- Dimming for writing focus
    'folke/twilight.nvim',
    opts = {
      vim.keymap.set('n', '<leader>zf', ':Twilight<CR>'),
    },
  },
  { -- Undotree
    'mbbill/undotree',
  },
  { -- Zen mode
    'folke/zen-mode.nvim',
    opts = {},
    config = function()
      require('zen-mode').setup {
        window = {
          -- width = 85,
          width = 120,
          transparent = true,
        },
      }
      vim.keymap.set('n', '<leader>zz', ':ZenMode<CR>')
    end,
  },
}
