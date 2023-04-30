local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local api = require 'Comment.api'
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
M.on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  vim.keymap.set('x', 'K', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)
  nmap('<CR>', '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition')
  nmap('<C-k>', '<cmd>Telescope diagnostics<cr>', 'Telescope diagnostics')
  nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'Help')

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- if you just want default config for the servers then put them in a table
M.servers = {
  bufls = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  html = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  dockerls = {},
  jsonls = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    format = { enabled = false },
    schemas = {
      {
        description = 'ESLint config',
        fileMatch = { '.eslintrc.json', '.eslintrc' },
        url = 'http://json.schemastore.org/eslintrc',
      },
      {
        description = 'Package config',
        fileMatch = { 'package.json' },
        url = 'https://json.schemastore.org/package',
      },
      {
        description = 'Packer config',
        fileMatch = { 'packer.json' },
        url = 'https://json.schemastore.org/packer',
      },
      {
        description = 'Renovate config',
        fileMatch = {
          'renovate.json',
          'renovate.json5',
          '.github/renovate.json',
          '.github/renovate.json5',
          '.renovaterc',
          '.renovaterc.json',
        },
        url = 'https://docs.renovatebot.com/renovate-schema',
      },
      {
        description = 'OpenApi config',
        fileMatch = { '*api*.json' },
        url = 'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json',
      },
    },
  },
  yamlls = {
    yaml = {
      keyOrdering = false,
    },
    schemaStore = {
      enable = true,
      url = 'https://www.schemastore.org/api/json/catalog.json',
    },
    schemas = {
      kubernetes = '*.yaml',
      ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
      ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
      ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
      ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
      ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
      ['http://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
      ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
      ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
      ['https://json.schemastore.org/gitlab-ci'] = '*gitlab-ci*.{yml,yaml}',
      ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '*api*.{yml,yaml}',
      ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*docker-compose*.{yml,yaml}',
      ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*flow*.{yml,yaml}',
    },
    format = { enabled = false },
    validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
    completion = true,
    hover = true,
  },
}

return M
