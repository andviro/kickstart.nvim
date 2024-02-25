return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    local map = vim.keymap.set
    require('mini.files').setup()
    map('n', '<leader><Tab>', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Open minifiles' })
  end,
}
