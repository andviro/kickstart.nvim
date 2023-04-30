local mason_lspconfig = require 'mason-lspconfig'

local cfg = require 'configs.common'

mason_lspconfig.setup {
  ensure_installed = cfg.servers,
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
