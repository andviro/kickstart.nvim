local api = vim.api
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup('TrimWhiteSpaceGrp', { clear = true })
api.nvim_create_autocmd('BufWritePre', {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

local FiletypeSpecific = api.nvim_create_augroup('FiletypeSpecific', { clear = true })
api.nvim_create_autocmd('BufWritePost', {
  pattern = { 'lfrc' },
  command = [[!lf -remote "send  source ~/.config/lf/lfrc"]],
  group = FiletypeSpecific,
})
api.nvim_create_autocmd('BufReadPre', {
  pattern = { '*.tmpl', '*.yaml', '*.yml' },
  command = [[if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif]],
  group = FiletypeSpecific,
})
-- vim.api.nvim_create_autocmd('VimEnter', {
--   desc = 'Auto select virtualenv Nvim open',
--   pattern = '*',
--   callback = function()
--     local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
--     if venv ~= '' then
--       require('venv-selector').retrieve_from_cache()
--     end
--   end,
--   once = true,
-- })
--
-- api.nvim_create_autocmd('BufEnter', { command = [[silent! lcd <afile>:p:h]] })

-- api.nvim_create_autocmd('BufEnter', {
--   desc = 'Auto switch shada per project',
--   pattern = '*',
--   callback = function()
--     local workspace_path = require('core.common').get_cwd()
--     local cache_dir = vim.fn.stdpath 'data'
--     local project_name = vim.fn.fnamemodify(workspace_path, ':t')
--     local project_dir = cache_dir .. '/myshada/' .. project_name
--     if vim.fn.isdirectory(project_dir) == 0 then
--       vim.fn.mkdir(project_dir, 'p')
--     end
--     local shadafile = project_dir .. '/' .. vim.fn.sha256(workspace_path):sub(1, 8) .. '.shada'
--     vim.opt.shadafile = shadafile
--     local opts = { noremap = true, silent = true, desc = 'Jump to Mark' }
--     vim.keymap.set('n', '<leader>sm', function()
--       require('telescope.builtin').marks { cwd = project_dir }
--     end, opts)
--   end,
-- })
--
-- don't auto comment new line
api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Close nvim if NvimTree is only running buffer
api.nvim_create_autocmd('BufEnter', { command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]] })

-- go to last loc when opening a buffer
api.nvim_create_autocmd('BufReadPost', { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] })

-- windows to close with "q"
api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'query', 'startuptime', 'qf', 'lspinfo', 'markdown', 'git', 'aerial', 'fugitive*', 'flog*', 'null-ls-info', 'doc/*.md' },
  callback = function(args)
    local buftype = vim.opt_local.buftype:get()
    if args.match == 'markdown' and buftype ~= 'help' then
      return
    end
    vim.fn.execute [[nnoremap <buffer><silent> q :close<CR>|nnoremap <buffer> <CR> <CR>]]
  end,
})
api.nvim_create_autocmd('FileType', { pattern = 'man', command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- disable list option in certain filetypes
api.nvim_create_autocmd('FileType', { pattern = { 'NeoGitStatus' }, command = [[setlocal list!]] })

-- Enable spell checking for certain file types
api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, { pattern = { '*.txt', '*.md', '*.tex' }, command = 'setlocal spell' })

-- api.nvim_create_autocmd({ 'VimEnter' }, { command = ':silent exec "!kill -s SIGWINCH $PPID"' })
