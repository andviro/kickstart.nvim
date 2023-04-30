local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

local b = null_ls.builtins

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  }
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

local sources = {
  -- go
  b.formatting.goimports,
  b.formatting.gofumpt,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { 'html', 'markdown', 'css' } }, -- so prettier works only on these filetypes

  -- misc
  b.formatting.fixjson,
  b.formatting.black,

  -- Lua
  b.formatting.stylua.with { '--indent_type', 'Spaces' },

  -- cpp
  -- b.formatting.clang_format,

  -- proto
  b.diagnostics.buf,
  b.formatting.buf,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
