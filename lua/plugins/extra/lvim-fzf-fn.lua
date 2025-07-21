return {
  {
    'lvim-tech/lvim-fm',
    dependencies = { 'lvim-tech/lvim-shell' },
    config = function()
      require('lvim-fm').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    keys = {
      {
        '<Leader><Tab>',
        '<Cmd>LvimFileManager<CR>',
        desc = 'Open file browser',
      },
    },
  },
}
