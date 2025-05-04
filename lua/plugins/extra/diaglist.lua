return {
  'onsails/diaglist.nvim',
  config = function()
    local map = vim.keymap.set
    require('diaglist').init {}
    map('n', '<leader>q', require('diaglist').open_all_diagnostics, { desc = 'Open diagnostics list' })
    map('n', '<leader>Q', require('diaglist').open_buffer_diagnostics, { desc = 'Open buffer diagnostics list' })
  end,
}
