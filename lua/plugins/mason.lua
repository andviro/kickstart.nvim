-- Automatically install LSPs to stdpath for neovim
return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    local cfg = require 'core.common'

    -- enable mason and configure icons
    local mason = require 'mason'
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(cfg.servers),
      max_concurrent_installers = 10,
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = cfg.on_attach,
          settings = cfg.servers[server_name],
        }
      end,
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'bash-language-server',
        'black',
        'black', -- python formatter
        'buf-language-server', -- protobuf linter
        'buf', -- protobuf linter
        'clangd',
        'clang-format',
        'css-lsp',
        'css-lsp',
        'deno',
        'dockerfile-language-server',
        'eslint_d', -- js linter
        'eslint-lsp',
        'fixjson',
        'flake8',
        'gofumpt',
        'goimports',
        'gopls',
        'html-lsp',
        'isort',
        'isort', -- python formatter
        'json-lsp',
        'lua-language-server',
        'marksman',
        'prettier',
        'prettier', -- prettier formatter
        'pylint', -- python linter
        'pyright',
        'rust-analyzer',
        'stylua',
        'stylua', -- lua formatter
        'taplo',
        'revive',
        'typescript-language-server',
        'yaml-language-server',
      },
    }
  end,
}
