local lspconfig = require 'lspconfig'
local cfg = require 'configs.common'

for _, lsp in ipairs(vim.tbl_keys(cfg.servers)) do
  lspconfig[lsp].setup {
    on_attach = cfg.on_attach,
    capabilities = cfg.capabilities,
  }
end
