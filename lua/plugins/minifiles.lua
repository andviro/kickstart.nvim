return {
  'echasnovski/mini.files',
  version = '*',
  keys = {
    { '<leader><Tab>', '<cmd>lua MiniFiles.open()<cr>', desc = 'Open minifiles' },
  },
  config = function()
    require('mini.files').setup()
  end,
}
