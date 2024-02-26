return {
  'SmiteshP/nvim-navic',
  config = function()
    local icons = require 'core.icons'
    require('nvim-navic').setup {
      icons = icons.kind,
      highlight = true,
      lsp = {
        auto_attach = false,
      },
      click = true,
      -- separator = '' .. icons.ui.ChevronRight .. ' ',
      depth_limit = 0,
      depth_limit_indicator = '..',
      safe_output = true,
    }
  end,
  -- event = 'VeryLazy',
}
