return {
  'Matthew-K310/floating-note.nvim',
  config = function()
    require('floating-note').setup { target_file = '~/Notes/obsidian-vault/quicknote.md' }
  end,
}
