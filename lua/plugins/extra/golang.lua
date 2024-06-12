return {
  'crispgm/nvim-go',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('go').setup {
      notify = true,
    }
    local NvimGo = vim.api.nvim_create_augroup('NvimGo', {
      clear = true,
    })
    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'NvimGoLintPopupPost',
      group = NvimGo,
      command = 'wincmd p',
    })
  end,
  event = 'VeryLazy',
}
