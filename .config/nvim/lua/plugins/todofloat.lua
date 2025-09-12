return {
  'Matthew-K310/todofloat.nvim',
  config = function()
    require('todofloat').setup { target_file = '~/Notes/todo.org' }
  end,
}
