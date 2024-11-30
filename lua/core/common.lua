local M = {}

M.get_cwd = function()
  local cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
    local client = vim.lsp.get_active_clients()[1]
    if client then
      cwd = client.config.root_dir
    else
      cwd = vim.fn.expand '%:p:h'
    end
  end
  return cwd
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- local api = require 'Comment.api'
-- local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
M.on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  -- vim.keymap.set('x', 'K', function()
  --   vim.api.nvim_feedkeys(esc, 'nx', false)
  --   api.toggle.linewise(vim.fn.visualmode())
  -- end)
  if client.server_capabilities.documentSymbolProvider then
    -- local navic = require 'nvim-navic'
    -- navic.attach(client, bufnr)
    local ok, outline = pcall(require, 'outline')
    if ok then
      outline.open { focus_outline = false }
    end
    nmap('<CR>', vim.lsp.buf.definition, 'Go to definition')
    nmap('<C-k>', '<cmd>Telescope diagnostics<cr>', 'Telescope diagnostics')
    -- nmap('K', vim.lsp.buf.hover, 'Help')
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    --nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    --nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    -- nmap('<leader><CR>', vim.lsp.buf.references, '[CR] symbol references')

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
  end
  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    nmap('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, '[T]oggle Inlay [H]ints')
  end
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  if client.name == 'gopls' then
    if not client.server_capabilities.semanticTokensProvider then
      local semantic = client.config.capabilities.textDocument.semanticTokens
      client.server_capabilities.semanticTokensProvider = {
        full = true,
        legend = {
          tokenTypes = semantic.tokenTypes,
          tokenModifiers = semantic.tokenModifiers,
        },
        range = true,
      }
    end
  end
end

-- if you just want default config for the servers then put them in a table
M.servers = {
  bufls = {},
  gopls = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
      semanticTokens = true,
    },
  },
  pyright = {},
  rust_analyzer = {},
  -- ts_ls = {},
  html = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  taplo = {
    schemaStore = {
      enable = true,
      url = 'https://www.schemastore.org/api/json/catalog.json',
    },
    schemas = {
      ['https://raw.githubusercontent.com/distinction-dev/alacritty-schema/main/alacritty/reference.json'] = '*alacritty.{yml,yaml}',
    },
  },
  dockerls = {},
  marksman = {},
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
      ['https://raw.githubusercontent.com/distinction-dev/alacritty-schema/main/alacritty/reference.json'] = '*alacritty.{yml,yaml}',
    },
    format = { enabled = false },
    validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
    completion = true,
    hover = true,
  },
}

return M
