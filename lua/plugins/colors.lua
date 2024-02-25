return {
  {
    'ishan9299/nvim-solarized-lua',
    priority = 1000,
    config = function()
      vim.g.solarized_visibility = 'low'
      vim.cmd 'colorscheme solarized'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
  },
}
