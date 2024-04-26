return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'folke/neodev.nvim',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' },
  },
  opts = {
    inlay_hints = { enabled = true },
  },
  config = function()
    require('neodev').setup()
    local lspconfig = require 'lspconfig'
    local cfg = require 'core.common'
    local util = require 'lspconfig/util'
    local path = util.path
    local function get_python_path(workspace)
      -- Use activated virtualenv.
      if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
      end
      -- Find and use virtualenv in workspace directory.
      for _, pattern in ipairs { '*', '.*' } do
        local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
        if match ~= '' then
          return path.join(path.dirname(match), 'bin', 'python')
        end
      end
      -- Fallback to system Python.
      return vim.fn.exepath 'python3' or vim.fn.exepath 'python' or 'python'
    end

    for _, lsp in ipairs(vim.tbl_keys(cfg.servers)) do
      local settings = cfg.servers[lsp]
      lspconfig[lsp].setup {
        on_attach = cfg.on_attach,
        capabilities = cfg.capabilities,
        settings = settings,
        before_init = function(_, config)
          if lsp == 'pyright' then
            config.settings.python.pythonPath = get_python_path(config.root_dir)
          end
        end,
      }
    end
  end,
}
