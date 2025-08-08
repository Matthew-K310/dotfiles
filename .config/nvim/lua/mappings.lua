-- local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':ene <BAR> startinsert <CR>', { noremap = true, silent = true })

vim.keymap.set('n', ',html', ':-1read $HOME/.config/nvim/lua/snippets/skeleton.html<CR>5jwf>a')

vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- autocomplete in normal text
vim.keymap.set('i', '<C-f>', '<C-x><C-f>', { noremap = true, silent = true })

-- spell check
-- vim.keymap.set('n', '<leader>ll', ':setlocal spell spelllang-en_us<CR>')

-- Update Lazy plugins
vim.keymap.set('n', '<leader>ls', ':Lazy sync<CR>')

-- Compile current .tex file to pdf
vim.keymap.set('n', '<leader>cp', ':!pdflatex %<CR>', { noremap = true, silent = true })

-- Open todo-float
vim.keymap.set('n', '<leader>td', ':Td<CR>', { silent = true })

-- Open floating-note (now quicknote)
vim.keymap.set('n', '<leader>fn', ':Fn<CR>', { silent = true })

-- fzf-lua mappings
vim.keymap.set('n', '<leader>.', ":lua require('fzf-lua').files({ cwd = '..' })<CR>") --search above
-- find files in project
vim.keymap.set('n', '<leader> ', ":lua require('fzf-lua').files()<CR>") --search cwd
vim.keymap.set('n', '<leader>pf', ":lua require('fzf-lua').files()<CR>") --search cwd
vim.keymap.set('n', '<leader>ns', ":lua require('fzf-lua').files({ cwd = '~/Notes/obsidian-vault' })<CR>") --search notes
vim.keymap.set('n', '<leader>fr', ":lua require('fzf-lua').oldfiles()<CR>") --last search
vim.keymap.set('n', '<leader>sg', ":lua require('fzf-lua').grep()<CR>") --grep
vim.keymap.set('n', '<leader>sG', ":lua require('fzf-lua').grep_cword()<CR>") --grep word under cursor
vim.keymap.set('n', '<leader>s/', ":lua require('fzf-lua').grep_curbuf()<CR>") -- grep in current file
vim.keymap.set('n', '<leader>ds', ":lua require('fzf-lua').lsp_document_symbols()<CR>")
vim.keymap.set('n', '<leader>ws', ":lua require('fzf-lua').lsp_workspace_symbols()<CR>")
vim.keymap.set('n', '<leader>df', ":lua require('fzf-lua').lsp_definitions()<CR>")
vim.keymap.set('n', '<leader>dr', ":lua require('fzf-lua').lsp_references()<CR>")

-- Undotree
vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)

-- Fugitive (git status)
vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyVimStarted', -- Waits for Lazy.nvim to complete
  callback = function()
    local custom_projects = require 'custom.projects'
    vim.keymap.set('n', '<leader>pp', function()
      custom_projects.projects {
        '~/.config/nvim',
        '~/Developer',
        '~/Notes', -- Replace with your paths
      }
    end, { desc = 'Fuzzy find and switch projects' })
  end,
})
