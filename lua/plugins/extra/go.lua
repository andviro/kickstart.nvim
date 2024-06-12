return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local capabilities = require('core.common').capabilities
    local on_attach = require('core.common').on_attach
    require('go').setup {
      lsp_on_attach = on_attach,
      lsp_cfg = {
        capabilities = capabilities,
      },
      lsp_codelens = false,
      lsp_inlay_hints = {
        enable = true,
        -- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
        -- inlay only available for 0.10.x
        style = 'eol',
        highlight = 'LspInlayHint',
      },
    }
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
