return {
  { -- Obsidian Integration
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    vim.keymap.set('n', '<leader>mn', ':ObsidianTemplate Main Note<CR>'),
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/obsidian-vault/remote/',
        },
        -- {
        --   name = 'work',
        --   path = '~/vaults/work',
        -- },
      },
      templates = {
        folder = '1 - Template',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      disable_frontmatter = true,
      -- see below for full list of options 👇
    },
  },
  -- { -- Remove MD013 warnings
  --   'nvim-lspconfig',
  --   opts = {
  --     diagnostics = {
  --       virtual_text = false,
  --       signs = false,
  --     },
  --   },
  -- },
}
