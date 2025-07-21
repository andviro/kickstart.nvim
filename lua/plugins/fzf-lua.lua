local cfg = require 'core.common'
return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = { 'ivy', 'fzf-native', fzf_colors = true },
  keys = {
    {
      '<C-p>',
      function()
        require('fzf-lua').files { cwd = cfg.get_cwd() }
      end,
      desc = 'O[p]en file [p]icker',
    },
    {
      '<C-j>',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
      desc = 'O[p]en file [p]icker',
    },
    {
      '<C-h>',
      function()
        require('fzf-lua').oldfiles {}
      end,
      desc = 'Open [h]istory',
    },
    {
      '<Leader>a',
      function()
        require('fzf-lua').lsp_code_actions { silent = true }
      end,
      desc = 'Code [A]ctions',
    },
  },
}
