vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>nf', ':ene <BAR> startinsert <CR>', { desc = '  > New file' }, { noremap = false, silent = true })
-- autocomplete in normal text
vim.keymap.set('i', '<C-f>', '<C-x><C-f>', { noremap = true, silent = true })

-- spell check
vim.keymap.set('n', '<leader>ll', ':setlocal spell spelllang-en_us<CR>')

-- Update Lazy plugins
vim.keymap.set('n', '<leader>ls', ':Lazy sync<CR>')

-- Open todo-float
vim.keymap.set('n', '<leader>td', ':Td<CR>', { silent = true })

-- Open floating-note
vim.keymap.set('n', '<leader>fn', ':Fn<CR>', { silent = true })
