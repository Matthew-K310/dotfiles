return { -- Secondary File Manager
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  vim.keymap.set('n', '<leader>n', ':Oil<CR>'),
  -- vim.keymap.set('n', '<leader>n', ':lua require("oil").toggle_float()<CR>'),
  -- vim.keymap.set('n', '<C-n>', ':lua require("oil").toggle_float()<CR>'),
  -- vim.keymap.set('n', '<C-d>', '<C-d>zz'),
  -- vim.keymap.set('n', '<C-u>', '<C-u>zz'),
  -- vim.keymap.set('n', '<C-f>', '<C-f>zz'),
  -- vim.keymap.set('n', '<C-b>', '<C-b>zz'),
  -- vim.keymap.set('n', 'Y', 'yy'),
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = {
          'actions.select',
          opts = { vertical = true },
          desc = 'Open the entry in a vertical split',
        },
        ['<C-h>'] = {
          'actions.select',
          opts = { horizontal = true },
          desc = 'Open the entry in a horizontal split',
        },
        ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' },
        ['<C-p>'] = 'actions.preview',
        ['q'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' },
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      float = {
        padding = 3,
        border = 'rounded',
      },
    }
  end,
}
