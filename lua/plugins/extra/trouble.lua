return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local map = vim.keymap.set
    require('trouble').setup {}
    map('n', '<leader>q', ':Trouble workspace_diagnostics<cr>', { desc = 'Toggle trouble list (global)', remap = false, silent = true })
    map('n', '<leader>Q', ':Trouble document_diagnostics<cr>', { desc = 'Toggle trouble list (document)', remap = false, silent = true })
  end,
}
