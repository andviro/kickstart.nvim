return {
  'dnlhc/glance.nvim',
  keys = {
    { '<leader><CR>', '<cmd>Glance references<CR>', desc = '[CR] symbol references' },
  },
  config = function()
    require('glance').setup {
      -- your configuration
    }
  end,
}
