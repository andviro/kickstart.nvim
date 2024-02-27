return {
  'hedyhli/outline.nvim',
  -- keys = {
  --   { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
  --},
  config = function()
    require('outline').setup {
      symbols = {
        filter = { 'String', 'Variable', exclude = true },
      },
      outline_window = {
        width = 40,
      },
    }
    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle outline' })
  end,
}
