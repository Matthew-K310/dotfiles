local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', ',html', ':-1read $HOME/.config/nvim/lua/snippets/skeleton.html<CR>5jwf>a')

-- Navigate panes with ctrl + h, j, k, l
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- autocomplete in normal text
vim.keymap.set('i', '<C-f>', '<C-x><C-f>', { noremap = true, silent = true })

-- spell check
vim.keymap.set('n', '<leader>ll', ':setlocal spell spelllang-en_us<CR>')

-- Update Lazy plugins
vim.keymap.set('n', '<leader>ls', ':Lazy sync<CR>')

-- Open todo-float
vim.keymap.set('n', '<leader>td', ':Td<CR>', { silent = true })

-- Open floating-note (now quicknote)
vim.keymap.set('n', '<leader>fn', ':Fn<CR>', { silent = true })

-- Treesitter toggling
vim.keymap.set('n', '<leader>tse', ':TSBufEnable highlight<CR>') -- enable highlighting
vim.keymap.set('n', '<leader>tsd', ':TSBufDisable highlight<CR>') -- disable highlighting

-- fzf-lua mappings
vim.keymap.set('n', '<leader>ff', ":lua require('fzf-lua').files({ cwd = '..' })<CR>") --search above
vim.keymap.set('n', '<leader>Ff', ":lua require('fzf-lua').files()<CR>") --search cwd
vim.keymap.set('n', '<leader>fh', ":lua require('fzf-lua').files({ cwd = '~/' })<CR>") --search home
vim.keymap.set('n', '<leader>fc', ":lua require('fzf-lua').files({ cwd = '~/.config' })<CR>") --search .config
vim.keymap.set('n', '<leader>fN', ":lua require('fzf-lua').files({ cwd = '~/.config/nvim' })<CR>") --search nvim config
vim.keymap.set('n', '<leader>fd', ":lua require('fzf-lua').files({ cwd = '~/Developer' })<CR>") --search Developer
vim.keymap.set('n', '<leader>fo', ":lua require('fzf-lua').files({ cwd = '~/obsidian-vault' })<CR>") --search Obsidians
vim.keymap.set('n', '<leader>fr', ":lua require('fzf-lua').oldfiles()<CR>") --last search
vim.keymap.set('n', '<leader>fg', ":lua require('fzf-lua').grep()<CR>") --grep
vim.keymap.set('n', '<leader>fG', ":lua require('fzf-lua').grep_cword()<CR>") --grep word under cursor
vim.keymap.set('n', '<leader>f/', ":lua require('fzf-lua').grep_curbuf()<CR>") -- grep in current file

-- Undotree
vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)

-- Fugitive (git)
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
